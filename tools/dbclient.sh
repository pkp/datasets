#!/bin/bash

# @file tools/dbclient.sh
#
# Copyright (c) 2014-2021 Simon Fraser University
# Copyright (c) 2010-2021 John Willinsky
# Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
#
# Connect to the database client.
#
# Requires the following environment vars to be set:
# - DBTYPE: Database type (MySQL/MySQLi/PostgreSQL)
# - DBUSERNAME: Database username
# - DBPASSWORD: Database password
# - DBNAME: Database name
# - DBHOST: Database hostname

set -e

case "$DBTYPE" in
	PostgreSQL)
		psql "$@" --username=$DBUSERNAME --host=$DBHOST $DBNAME
		;;
	MySQL|MySQLi)
		mysql "$@" --user=$DBUSERNAME --password=$DBPASSWORD --host=$DBHOST $DBNAME
		;;
	*)
		echo "Unknown DBTYPE \"${DBTYPE}\"!"
		exit 1
esac
