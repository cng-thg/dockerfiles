#!/bin/bash
###############################################################################
# Create MySQL admin user
###############################################################################

echo "Creating MySQL admin user"
## Start MySQL service
echo "Starting MySQL service"
/usr/bin/mysqld_safe > /dev/null 2>&1 &

# Check if mysql service is up
RET=1

while [[ RET -ne 0 ]]; do
  echo "=> Waiting for confirmation of MySQL service startup"

  sleep 5

  mysql -uroot -e "status" > /dev/null 2>&1

  RET=$?
done

## Getting host ip
HOST_IP=${HOST_IP:-$(ip route | cut -d " " -f 3 | head -n 1)}

## Set MySQL admin user
MYSQL_ADMIN_USER=${MYSQL_ADMIN_USER}
MYSQL_ADMIN_PASSWD=${MYSQL_ADMIN_PASSWD}

# If admin user is empty, exits script.
if [[ -z "$MYSQL_ADMIN_USER" ]]; then
  echo "No admin name given, exiting."
  exit 1
fi

## Crete admin user
# MySQL admin user is created for remote admin tasks. For safety, script uses
# docker host ip, so you need to log on docker host and then performs admin
# tasks via mysql -h <CONTAINER_IP> -u <MYSQL_ADMIN_USER} -p<PASSWD>
#mysql -uroot -e "CREATE USER IF NOT EXISTS ${MYSQL_ADMIN_USER}@${HOST_IP} IDENTIFIED BY '${MYSQL_ADMIN_PASSWD}'"
echo "Creating ${MYSQL_ADMIN_USER}"

mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO ${MYSQL_ADMIN_USER}@${HOST_IP} IDENTIFIED BY '${MYSQL_ADMIN_PASSWD}' WITH GRANT OPTION"

mysql -uroot -e "FLUSH PRIVILEGES"

## Stop MySQL service
echo "Stopping MySQL service"
mysqladmin -uroot shutdown
