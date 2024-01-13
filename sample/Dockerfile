FROM stupidwiseman/mariadb:i386

# COPY ./my.cnf my.cnf  謎のコンフリクトが発生するのと、特に追記の必要性がないのでコメントアウト
COPY ./setup.sh setup.sh
COPY ./sec_inst.exp sec_inst.exp

RUN chmod 755 setup.sh && chmod 755 sec_inst.exp

EXPOSE 3306

CMD [ "/bin/bash", "setup.sh" ]