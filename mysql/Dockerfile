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

## Exposed ENV
ENV MYSQL_USER admin
ENV MYSQL_USER_PASSWORD admin
ENV MYSQL_ROOT_PASSWORD root
#ENV DB_NAME development

## Setting up MySQL
# Start MySQL service
RUN service mysql start && \
# Set root password
  mysqladmin -u root password ${MYSQL_ROOT_PASSWORD:-""} && \
# Create a new user (default=admin)
  mysql -uroot --password=${MYSQL_ROOT_PASSWORD:-""} -e \
  "CREATE USER ${MYSQL_USER:-""}@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD:-""}'" && \
# Grant privileges to default user to default db
  mysql -uroot --password=${MYSQL_ROOT_PASSWORD:-""} -e \
  "GRANT ALL PRIVILEGES ON *.* TO ${MYSQL_USER:-""}@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD:-""}' WITH GRANT OPTION" && \
  mysql -uroot --password=${MYSQL_ROOT_PASSWORD:-""} -e \
  "GRANT GRANT OPTION ON *.* TO ${MYSQL_USER:-""}@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD:-""}'"  && \
# Grant remote acces to root via docker host
  mysql -uroot --password=${MYSQL_ROOT_PASSWORD:-""} -e \
  "GRANT ALL PRIVILEGES ON *.* TO 'root'@${HOST_IP:-$(ip route | cut -d " " -f 3 | head -n 1)} IDENTIFIED BY '${MYSQL_ROOT_PASSWORD:-""}'" && \
# Grant grant options
  mysql -uroot --password=${MYSQL_ROOT_PASSWORD:-""} -e \
  "GRANT GRANT OPTION ON *.* TO 'root'@${HOST_IP:-$(ip route | cut -d " " -f 3 | head -n 1)} IDENTIFIED BY '${MYSQL_ROOT_PASSWORD:-""}'" && \

# "Reload privileges tables
  mysql -uroot --password=${MYSQL_ROOT_PASSWORD:-""} -e \
  "FLUSH PRIVILEGES"

# ** WARNING **
# Disable this in production environment
# Create a new database (default=development)
#  mysql -uroot --password=${MYSQL_ROOT_PASSWORD:-""} -e \
#  "CREATE DATABASE ${DB_NAME:-""}" && \

## Securing MySQL
#RUN service mysql start && \
# Remove anonymous users
#  mysql -uroot --password=${MYSQL_ROOT_PASSWORD:-""} -e \
#  "DELETE FROM mysql.user WHERE User=''" && \
# Remove remote root
#  mysql -uroot --password=${MYSQL_ROOT_PASSWORD:-""} -e \
#  "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')" && \
# Remove test database
#  mysql -uroot --password=${MYSQL_ROOT_PASSWORD:-""} -e \
#  "DROP DATABASE test" && \
# Remove privileges on test database
#  mysql -uroot --password=${MYSQL_ROOT_PASSWORD:-""} -e \
#  "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'" && \
# Reload privileges tables
#  mysql -uroot --password=${MYSQL_ROOT_PASSWORD:-""} -e \
#  "FLUSH PRIVILEGES"

## Setting up Serf
ENV SERF_ROLE mysql

## Setting up supervisor
ADD mysql.conf /etc/supervisor/conf.d/nginx.conf

## Add MySQL configuration
ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf
ADD mysql.sh /opt/mysql.sh
RUN chmod +755 /opt/mysql.sh

## Add VOLUMEs to allow backup of config and databases
VOLUME  ["/var/lib/mysql"]

## Expose MySQL port
EXPOSE 3306

## Run supervisor
CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
