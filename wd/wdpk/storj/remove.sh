#!/bin/sh
. ./common.sh && capture_run $* ;

INSTALL_DIR=$1

rm -rf /var/www/storj
rm -rf $INSTALL_DIR
