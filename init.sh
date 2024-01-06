#!/bin/bash

# Variable Set
TZ=${TZ:-Asia/Tokyo}
DBDIR=${DBDIR:-"/var/lib/mysql"}
LOGDIR=${LOGDIR:-"/var/log/mysql"}
SQLCONFSRC="/my.cnf"
SQLCONFDIST="/etc/mysql/mariadb.cnf"

if [ -e $SQLCONFSRC ] ; then
    cat $SQLCONFSRC >> $SQLCONFDIST
    rm $SQLCONFSRC
fi

if [ -d $DBDIR ] ; then
    rm -rf ${DBDIR}
fi
if [ -d $LOGDIR ] ; then
    rm -rf ${LOGDIR}
fi