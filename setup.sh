#!/bin/bash

set -e

appSetup () {
    DEPLOY=${DEPLOY:-dev}
    TZ=${TZ:-Asia/Tokyo}
    UNIX_SOCKET_AUTH=${UNIX_SOCKET_AUTH:-Y}
    MARIADB_ROOT_PASSWORD=${MARIADB_ROOT_PASSWORD:-password}
    MARIADB_DATABASE=${MARIADB_DATABASE:-DB1}
    MARIADB_USER=${MARIADB_USER:-user}
    MARIADB_PASSWORD=${MARIADB_PASSWORD:-user_pwd}
    SQLDIR=${SQLDIR:/var/lib/mysql}
    SQLCONFSRC="/mysql.cnf"
    SQLCONFDIST="/etc/mysql/mysql.cnf"
}

# Set Up to the MariaDB
mysql_install_db --datadir=$SQLDIR

if [ -e /mysql.cnf ] ; then
    mv $SQLCONFSRC $SQLCONFDIST
    chmod 644 $SQLCONFDIST
fi

/etc/init.d/mariadb start

if [ -e /sec_inst.exp ] ; then
    expect /sec_inst.exp
fi

touch /var/log/mysql/mysqld.log
chmod -R 755 /etc/mysql

apt-get purge expect
apt-get clean autoclean
apt-get autoremove --yes
rm -rf /var/lib/{apt,dpkg,cache,log}
rm -rf /tmp/* /var/tmp/*