#############################################################################
# Dockerfile to build mysql image
# Based on yesops/serf image
#############################################################################


## Set the base image to Ubuntu
FROM yesops/serf

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Update repos and install packages
RUN apt-get -qq update && \
apt-get install -y mysql-server

## Securing MySQL
RUN service mysql start && \
# Remove anonymous users
  mysql -uroot --password=${MYSQL_ROOT_PASSWORD:-""} -e \
  "DELETE FROM mysql.user WHERE User=''" && \
# Remove remote root
  mysql -uroot --password=${MYSQL_ROOT_PASSWORD:-""} -e \
  "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')" && \
# Reload privileges tables
  mysql -uroot --password=${MYSQL_ROOT_PASSWORD:-""} -e \
  "FLUSH PRIVILEGES"

## Setting up Serf
ENV SERF_ROLE mysql

## Setting up supervisor
ADD mysql.conf /etc/supervisor/conf.d/mysql.conf

## Add MySQL configuration
ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf
## Add MySQL scripts
# Admin creation
ADD mysql_create_admin.sh /opt/mysql_create_admin.sh
RUN chmod +775 /opt/mysql_create_admin.sh
# User creation
#ADD mysql_create_user.sh /opt/mysql_create_user.sh
#RUN chmod +775 /opt/mysql_create_user.sh
# DB creation
ADD mysql_create_db.sh /opt/mysql_create_db.sh
RUN chmod +775 /opt/mysql_create_db.sh
# Service start
ADD mysql.sh /opt/mysql.sh
RUN chmod +755 /opt/mysql.sh

## Add VOLUMEs to allow backup of config and databases
VOLUME  ["/var/lib/mysql", "/var/log/mysql"]

## Expose MySQL port
EXPOSE 3306

## Run supervisor
CMD ["/opt/mysql.sh"]
