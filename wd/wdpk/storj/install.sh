#!/bin/sh

# Found 
# Incorrect Path Usage
#
# Upload path ($1) is incorrect as per SDK
# IT should be /mnt/HD/HD_a2/Nas_Prog/_install
# WHILE ACTUALLY IT IS /mnt/HD/HD_a2/Nas_Prog/_install/storj
# 		OR /mnt/HD/HD_a2/Nas_Prog/_install/$MNAME
# However logic here seems to be OK for step #1 (install.sh) at least
#
#
# Destination Path ($2) 
# As per SDK: /mnt/HD/HD_a2/Nas_Prog/$MNAME
# As per Actual : /mnt/HD/HD_a2/Nas_Prog
#
#
# As init.sh is not getting setup, it can't be launched as expected !!!
# 


echo `date` >> /tmp/abc
echo "Running script $0 with $# args: $* " >> /tmp/abc
echo ls -l /mnt/HD/HD_a2/Nas_Prog/_install/storj >> /tmp/abc
ls -l /mnt/HD/HD_a2/Nas_Prog/_install/storj  >> /tmp/abc

#. ./common.sh && capture_run $* ;
MNAME=storj
path_src=$1
path_des=$2

# As per SDK : $1 : /mnt/HD/HD_a2/Nas_Prog/_install $2: /mnt/HD/HD_a2/Nas_Prog/$MNAME
# As per ACTUAL:  $1: /mnt/HD/HD_a2/Nas_Prog/_install/$MNAME $2: /mnt/HD/HD_a2/Nas_Prog
#mv $path_src $path_des

target_dir=$path_des/$MNAME
mkdir $target_dir
cp -a $path_src/*.sh $target_dir
cp -rpa $path_src/web $target_dir
mv $path_src $target_dir

echo ls -l /mnt/HD/HD_a2/Nas_Prog/storj >> /tmp/abc
ls -l /mnt/HD/HD_a2/Nas_Prog/storj >> /tmp/abc
