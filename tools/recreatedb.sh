#!/bin/bash

# Drop and re-create a database according to the currently configured CI environment.
# Your environment must be configured first using the environment.sh script.

set -e

case "${DBTYPE}" in
	"MySQL" | "MySQLi")
		echo "DROP DATABASE IF EXISTS \`${DBNAME}\`; CREATE DATABASE \`${DBNAME}\` DEFAULT CHARACTER SET utf8; GRANT ALL ON \`${DBNAME}\`.* TO \`${DBUSERNAME}\`@localhost IDENTIFIED BY '${DBPASSWORD}';" | sudo mysql
		;;

	"PostgreSQL")
		dropdb --if-exists ${DBNAME} && createdb --owner=${DBUSERNAME} ${DBNAME}
		;;
	*) echo "Unknown database type \"${DBTYPE}\". (Did you configure your environment?)"; exit -1 ;;
esac
