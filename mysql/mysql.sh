#!/bin/sh
###############################################################################
# Start MySQL service
###############################################################################

CREATE_ADMIN=/opt/mysql_create_admin.sh
CREATE_DB=/opt/mysql_create_db.sh

## Create admin user
if [ -e "$CREATE_ADMIN" ]; then
  $CREATE_ADMIN
fi

## Create database
if [ -e "$CREATE_DB" ]; then
  $CREATE_DB
fi

## Start supervisor
if [ $(which supervisord) ]; then
  supervisord -n -c /etc/supervisor/supervisord.conf
fi
