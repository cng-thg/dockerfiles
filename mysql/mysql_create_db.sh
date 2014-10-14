#!/bin/bash
###############################################################################
# Create MySQL Database
###############################################################################

## MySQL Database name
MYSQL_DB_NAME=${MYSQL_DB_NAME}

## Check if database name was given
if [[ -z "${MYSQL_DB_NAME}" ]]; then
  echo "No Database name given, exiting."
  exit 1
fi

echo "Creating MySQL database"
## Start MySQL service
echo "Starting MySQL service"
/usr/bin/mysqld_safe > /dev/null 2>&1 &

## Check if mysql service is up
RET=1

while [[ RET -ne 0 ]]; do
  echo "=> Waiting for confirmation of MySQL service startup"

  sleep 5

  mysql -uroot -e "status" > /dev/null 2>&1

  RET=$?
done

## Creating database ${MYSQL_ADMIN_USER}
echo "Creating ${MYSQL_DB_NAME}"
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB_NAME}"

## Grant permissions to user
# If user is empty, exits script.
if [[ -z "${MYSQL_USER}" ]]; then
  echo "No user name given, exiting."
  exit 1
fi

echo "Creating ${MYSQL_USER}"
mysql -uroot -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB_NAME}.* TO ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_USER_PASSWD}'"

## Stop MySQL service
echo "Stopping MySQL service"
mysqladmin -uroot shutdown
