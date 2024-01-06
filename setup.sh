#!/bin/bash

# Variable Set
TZ=${TZ:-Asia/Tokyo}
UNIX_SOCKET_AUTH=${UNIX_SOCKET_AUTH:-n}
MARIADB_ROOT_PASSWORD=${MARIADB_ROOT_PASSWORD:-n}
MARIADB_USER=${MARIADB_USER:-mysql}
DBDIR=${DBDIR:-"/var/lib/mysql"}
LOGDIR=${LOGDIR:-"/var/log/mysql"}

if [ $MARIADB_ROOT_PASSWORD == "n" ] ; then
    PASSSET=n
else
    PASSSET=Y
fi

# Set Up to the MariaDB

## Create directories if it does not already exist
if [ ! -d $LOGDIR ] ; then
    mkdir -p $LOGDIR
fi
touch /var/log/mysql/mysqld.log

## MySQL DB Setup
if [ ! -d $DBDIR ] ; then
    mysql_install_db --datadir=$DBDIR --user=$MARIADB_USER
fi
chmod -R 755 $DBDIR
chown -R ${MARIADB_USER}:mysql $DBDIR

/etc/init.d/mariadb start

# MariaDB Security Install

if [ -e /sec_inst.exp ] ; then
    expect /sec_inst.exp $UNIX_SOCKET_AUTH $MARIADB_ROOT_PASSWORD $PASSSET
fi

apt-get -y purge expect
apt-get clean autoclean
apt-get -y autoremove
rm -rf /var/lib/{apt,dpkg,cache,log}
rm -rf /tmp/* /var/tmp/*
rm init.sh
rm sec_inst.exp
rm setup.sh