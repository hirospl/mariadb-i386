FROM debian:bookworm-slim

COPY ./init.sh init.sh
COPY ./my.cnf my.cnf
COPY ./sec_inst.exp sec_inst.exp
COPY ./setup.sh setup.sh

RUN apt-get update \
&&  apt-get -y install mariadb-server \
    expect \
&&  /bin/bash /init.sh

CMD [ "/bin/bash /setup.sh" ]