#!/bin/bash

# Variable Set
TZ=${TZ:-Asia/Tokyo}
DBDIR=${DBDIR:-"/var/lib/mysql"}
LOGDIR=${LOGDIR:-"/var/log/mysql"}

if [ -d $DBDIR ] ; then
    rm -rf ${DBDIR}
fi
if [ -d $LOGDIR ] ; then
    rm -rf ${LOGDIR}
fi