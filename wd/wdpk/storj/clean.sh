#!/bin/sh
echo `date` >> /tmp/abc
echo "Running script $0 with $# args: $* " >> /tmp/abc
. ./common.sh && capture_run $* ;
. /mnt/HD/HD_a2/.temp/storj/common.sh && capture_run $* ;

