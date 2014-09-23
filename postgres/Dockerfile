#############################################################################
# Dockerfile to build Postgres image 
# Based on yesops/base image                                         
#############################################################################


## Set the base image to Ubuntu
FROM yesops/base

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Postgres version
ENV PG_VERSION 9.3

## Add the PostgreSQL PGP key to verify their Debian packages.
## It should be the same key as https://www.postgresql.org/media/keys/ACCC4CF8.asc
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys \ 
  B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

## Add PostgreSQL's repository. It contains the most recent stable release
## of PostgreSQL, ``9.3``.
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list

## Update repos and install packages
RUN apt-get -qq update && apt-get install -y \
  postgresql-$PG_VERSION \
  postgresql-client-$PG_VERSION \
  postgresql-contrib-$PG_VERSION


## Setting up Postgres
# Adjust PostgreSQL configuration so that remote connections to the
# database are possible. 
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/$PG_VERSION/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/$PG_VERSION/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/$PG_VERSION/main/postgresql.conf

## Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

## Expose the PostgreSQL port
EXPOSE 5432

## Set environment variables for PG
ENV PATH /usr/lib/postgresql/$PG_VERSION/bin:$PATH
ENV PGDATA /var/lib/postgresql/$PG_VERSION/main
ENV PG_CONF config_file=/etc/postgresql/$PG_VERSION/main/postgresql.conf

## Run commands as postgres user
USER postgres

# Set the default command to run when starting the container
CMD postgres -c $PG_CONF
