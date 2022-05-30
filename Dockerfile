FROM postgres:10

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && \
    apt-get -y install apt-utils lsb-release && \
    apt-get -y install gnupg2 wget iputils-ping dnsutils && \
    apt-get -y install postgresql-plperl-10 && \
    wget https://github.com/zubkov-andrei/pg_profile/releases/download/0.3.6/pg_profile--0.3.6.tar.gz && \
    tar xzf pg_profile--0.3.6.tar.gz --directory $(pg_config --sharedir)/extension && \
    apt-get update && \
    apt-get -y install awscli && \
    apt-get -y install barman-cli && \
    apt-get clean all && \
    unset DEBIAN_FRONTEND

# before init - /var/lib/postgresql/data not exists, postgres user not exists
#COPY cp /tmp/archive_wal.sh /var/lib/postgresql/data/archive_wal.sh
#RUN  chown 999:999 /var/lib/postgresql/data/archive_wal.sh

COPY archive_wal.sh /tmp/archive_wal.sh
RUN chown 999:999 /tmp/archive_wal.sh && chmod 700 /tmp/archive_wal.sh
COPY crlogfiles.sh /tmp/crlogfiles.sh
RUN chown 999:999 /tmp/crlogfiles.sh && chmod 700 /tmp/crlogfiles.sh

WORKDIR /var/lib/postgresql
