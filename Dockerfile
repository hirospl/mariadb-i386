FROM debian:stable-slim

COPY ./init.sh init.sh

RUN groupadd -r mysql \
&&  useradd -r -g mysql mysql --home-dir /var/lib/mysql \
&&  apt-get update \
&&  DEBIAN_FRONTEND=noninteractive apt-get -y install mariadb-server \
    expect \
&&  /etc/init.d/mariadb stop \
&&  /bin/bash init.sh \
&&  apt-get clean autoclean \
&&  apt-get -y autoremove \
&&  rm -rf /var/lib/{apt,dpkg,cache,log} \
&&  rm -rf /tmp/* /var/tmp/* \
&&  rm init.sh

EXPOSE 3306