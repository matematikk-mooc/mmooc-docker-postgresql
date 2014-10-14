# https://github.com/instructure/canvas-lms/wiki/Production-Start#installing-postgres
# https://docs.docker.com/examples/postgresql_service/

FROM ubuntu:12.04

RUN apt-get -y update

RUN apt-get -y install postgresql-9.1 postgresql-contrib-9.1

EXPOSE 5432

ADD pg_hba.conf /etc/postgresql/9.1/main/
ADD postgresql.conf /etc/postgresql/9.1/main/
ADD postgres /root/postgres
ADD initdb /root/initdb

USER postgres

#CMD ["/usr/lib/postgresql/9.1/bin/postgres", "-D", "/var/lib/postgresql/9.1/main", "-c", "config_file=/etc/postgresql/9.1/main/postgresql.conf"]
CMD ["bin/bash", "/root/postgres"]
