#!/bin/sh

if [ ! -f /var/run/mysql_admin_user.pid ]; then
  /opt/mysql_create_admin.sh
fi

exec mysqld_safe
