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
}

/etc/init.d/mariadb stop

if [ -d $SQLDIR ] ; then
    rm -rf "${SQLDIR}/*"
fi