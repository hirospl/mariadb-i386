FROM debian:stable-slim

COPY ./init.sh init.sh
COPY ./my.cnf my.cnf
COPY ./sec_inst.exp sec_inst.exp
COPY ./setup.sh setup.sh

RUN apt-get update \
&&  apt-get -y install mariadb-server \
    expect \
&&  /etc/init.d/mariadb stop \
&&  /bin/bash init.sh \
&&  apt-get clean autoclean \
&&  apt-get -y autoremove \
&&  rm -rf /var/lib/{apt,dpkg,cache,log} \
&&  rm -rf /tmp/* /var/tmp/* \
&&  rm init.sh

EXPOSE 3306