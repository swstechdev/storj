#!/bin/sh
echo `date` >> /tmp/abc
echo "Running script $0 with $# args: $* " >> /tmp/abc
. ./common.sh && capture_run $* ;
path_src=$1
path_des=$2
mv $path_src $path_des
