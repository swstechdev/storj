#!/bin/sh
. ./common.sh && capture_run $* ;
path_src=$1
path_des=$2
mv $path_src $path_des
