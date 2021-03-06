# https://github.com/instructure/canvas-lms/wiki/Production-Start#installing-postgres
# https://docs.docker.com/examples/postgresql_service/

FROM ubuntu:16.04

RUN apt-get -y update && \
    apt-get -y install postgresql-9.5 postgresql-contrib-9.5

EXPOSE 5432

ADD pg_hba.conf /etc/postgresql/9.5/main/
ADD postgresql.conf /etc/postgresql/9.5/main/
ADD initdb /root/initdb

RUN mkdir /home/postgres && \
    chown postgres.postgres /home/postgres
ADD postgres /home/postgres/postgres

USER postgres

CMD ["/bin/bash", "/home/postgres/postgres"]
