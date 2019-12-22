#!/bin/sh
. ./common.sh && capture_run $* ;
WEBPATH="/var/www/storj"
mkdir -p /mnt/HD/HD_a2/.temp/storj/data
mkdir -p /mnt/HD/HD_a2/.temp/storj/images
mkdir -p /mnt/HD/HD_a2/.temp/storj/temp
cp -a $WEBPATH/data/* /mnt/HD/HD_a2/.temp/storj/data
cp -a $WEBPATH/images/* /mnt/HD/HD_a2/.temp/storj/images
cp -a $WEBPATH/temp/* /mnt/HD/HD_a2/.temp/storj/temp
