FROM postgres:10

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install perl postgresql-plperl-10
RUN apt-get -y install barman-cli awscli gosu

RUN apt-get clean all

WORKDIR /var/lib/postgresql

COPY minio-entrypoint.sh /minio-entrypoint.sh
RUN chmod 700 /minio-entrypoint.sh

COPY archive_wal.sh /archive_wal.sh

ENTRYPOINT ["/minio-entrypoint.sh"]

CMD ["postgres"]
