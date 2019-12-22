#!/bin/bash

lanid=3
ifconfig lo${lanid} create inet 192.168.0.${lanid} netmask 255.255.255.0

#TODO : Add update pf.conf file for packet filter settings (NAT & listening ports !)
cat >> /etc/rc.sys <<NWIF_DEF
ipv6_network_interfaces="none"
ifconfig_lo${$lanid}="inet 192.168.0.${$lanid} netmask 255.255.255.0"
NWIF_DEF
service netif restart

cat >> /etc/pf.conf <<PF_CONF_ADDON

# -----------------------------------------------------------
#  Added for Storj Admin Jails NW config
# -----------------------------------------------------------
ext_if="em0"
storjadminjail="192.168.0.3"
nat on \$ext_if from \$storjadminjail to any -> (\$ext_if)

#Redirect web traffic for stoj admin to the jail.
webport=8080
rdr on \$ext_if proto tcp from any to (\$ext_if) port \$webport -> \$storjadminjail port http
pass in on \$ext_if proto tcp to \$storjadminjail port { http, https } keep state

# -----------------------------------------------------------

PF_CONF_ADDON
sysrc pf_enable="yes"
service pf restart


wget -O /tmp/pkglist.json https://raw.githubusercontent.com/swstechdev/freenas/master/pkg-list.json 
iocage create -r 11.2-RELEASE -p /tmp/pkglist.json -n storjadmin allow_raw_sockets=1 defaultrouter="192.168.1.1" resolver="nameserver 192.168.1.1; nameserver 8.8.8.8"  ip4_addr="lo${lanid}|192.168.0.${lanid}/24"

wget -O /tmp/storjadmin.json  https://raw.githubusercontent.com/swstechdev/freenas/master/storj.json 
#iocage fetch -P -n /tmp/storjadmin.json --branch 'master' # Not required

iocage exec storjadmin git clone https://github.com/swstechdev/freenas.git /root/storjadmin
iocage exec storjadmin bash /root/storjadmin/post_install.sh standard

