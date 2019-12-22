#!/bin/sh
echo `date` >> /tmp/abc
echo "Running script $0 with $# args: $* " >> /tmp/abc
path=$1
WEBPATH="/var/www/storj"

ln -sf $path/web $WEBPATH
# Above is not running, let's try our own
#ln -sf /mnt/HD/HD_a2/Nas_Prog/storj /var/www/storj

mkdir -p $WEBPATH/data
mkdir -p $WEBPATH/images
mkdir -p $WEBPATH/temp
cp -a /mnt/HD/HD_a2/.temp/storj/data/* $WEBPATH/data/
cp -a /mnt/HD/HD_a2/.temp/storj/images/* $WEBPATH/images/
cp -a /mnt/HD/HD_a2/.temp/storj/temp/* $WEBPATH/temp/
cp -a /mnt/HD/HD_a2/.temp/storj/web/* $WEBPATH/*
rm -rf /mnt/HD/HD_a2/.temp/storj
chmod 777 -R $WEBPATH
