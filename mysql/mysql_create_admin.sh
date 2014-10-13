#!/bin/bash

if [ -f /var/run/mysql_admin_user.pid ]; then
  echo "MySQL 'admin' user already created!"
  exit 0
fi


# Start MySQL service
service mysql start

RET=1

while [[ RET -ne 0 ]]; do
  echo "=> Waiting for confirmation of MySQL service startup"

  sleep 5

  mysql -uroot -e "status" > /dev/null 2>&1

  RET=$?
done

# Getting host ip
HOST_IP=${HOST_IP:-$(ip route | cut -d " " -f 3 | head -n 1)}

# Set MySQL admin user (default = admin with blank password)
MYSQL_ADMIN_USER=${MYSQL_ADMIN_USER:-"admin"}
MYSQL_ADMIN_PASSWD=${MYSQL_ADMIN_PASSWD:-""}


echo "=> Creating MySQL user ${MYSQL_ADMIN_USER} with ${MYSQL_ADMIN_PASSWD} password"

# Crete user at docker host and grant privileges
mysql -uroot -e "CREATE USER ${MYSQL_ADMIN_USER}@${HOST_IP} IDENTIFIED BY '${MYSQL_ADMIN_PASSWD}'"

mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO ${MYSQL_ADMIN_USER}@${HOST_IP} IDENTIFIED BY '${MYSQL_ADMIN_PASSWD}' WITH GRANT OPTION"

mysql -uroot -e "FLUSH PRIVILEGES"

echo "=> Done!"
echo "========================================================================"
echo "You can now connect to this MySQL Server using:"
echo ""
echo " mysql -u$MYSQL_ADMIN_USER -p$MYSQL_ADMIN_PASSWD -h<host> -P<port>"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "MySQL user 'root' has no password but only allows local connections"
echo "========================================================================"

touch /var/run/mysql_admin_user.pid

# Stop MySQL service
mysqladmin -uroot shutdown
