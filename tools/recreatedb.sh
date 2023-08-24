#!/bin/bash

# Drop and re-create a database according to the currently configured CI environment.
# Your environment must be configured first using the environment.sh script.

set -e

case "${DBTYPE}" in
	"MySQL" | "MySQLi" | "MariaDB")
		sudo mysql -u root -e "DROP DATABASE IF EXISTS \`${DBNAME}\`; CREATE DATABASE \`${DBNAME}\` DEFAULT CHARACTER SET utf8;"
		sudo mysql -u root -e "CREATE USER \`${DBUSERNAME}\`@${DBHOST} IDENTIFIED BY '${DBPASSWORD}'"
		sudo mysql -u root -e "GRANT ALL ON \`${DBNAME}\`.* TO \`${DBUSERNAME}\`@${DBHOST} WITH GRANT OPTION"
		;;

	"PostgreSQL")
		dropdb --if-exists ${DBNAME} && createdb --owner=${DBUSERNAME} ${DBNAME}
		;;
	*) echo "Unknown database type \"${DBTYPE}\". (Did you configure your environment?)"; exit -1 ;;
esac
