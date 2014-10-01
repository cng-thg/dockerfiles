#!/bin/sh

export DB_HOST=$(serf members -tag role=${DB_ROLE:-"mysql"} | grep alive | awk {'print $2'} | cut -d':' -f1)

DBHOST=$(serf members -tag role=${DB_ROLE:-"mysql"} | grep alive | awk {'print $2'} | cut -d':' -f1)

export DB=mysql

exec serf monitor
