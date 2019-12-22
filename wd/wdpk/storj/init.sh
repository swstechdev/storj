#!/bin/sh
. ./common.sh && capture_run $* ;
path=$1
WEBPATH="/var/www/storj"

ln -sf $path/web $WEBPATH

mkdir -p $WEBPATH/data
mkdir -p $WEBPATH/images
mkdir -p $WEBPATH/temp
cp -a /mnt/HD/HD_a2/.temp/storj/data/* $WEBPATH/data/
cp -a /mnt/HD/HD_a2/.temp/storj/images/* $WEBPATH/images/
cp -a /mnt/HD/HD_a2/.temp/storj/temp/* $WEBPATH/temp/
rm -rf /mnt/HD/HD_a2/.temp/storj
chmod 777 -R $WEBPATH
