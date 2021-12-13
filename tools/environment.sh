#!/bin/bash

# Configure the shell environment for continuous integration.
# This environment will configure the CI tests (e.g. providing the OJS install
# test with the configuration parameters it needs) and also the other scripts here.
#
# Usage:
# . environment.sh app branch [dbtype]
#   ...where "app" is: ojs, omp, ops
#   ...where "branch" is: main, stable-3_1_2, ...
#   ...where "dbtype" is: MySQLi, PostgreSQL (defaults to MySQLi)
#
# Note that the "." in ". ci-environment.sh" is necessary in order to expose
# the environment variables!
#
# This uses the following conventions:
#  - Database:
#    - Username: [app]-ci (e.g. "ojs-ci")
#    - Password: Same as username
#    - Name: [app]-[branch]-ci (e.g. "ojs-stable-ci")
#    - Host: localhost
#  - Files:
#    - Stored in a "files" subdirectory of the installation
#      (This is insecure and NOT RECOMMENDED outside of a dev environment!)
#  - Base URL: http://localhost/git/[app]-[branch] (e.g. ojs-main)

# === Configuration for your environment ===

# Dummy files for uploads during testing
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
export DUMMY_PDF=${SCRIPT_DIR}/dummy.pdf
export DUMMY_ZIP=${SCRIPT_DIR}/dummy.zip

# === It shouldn't be necessary to configure anything below here. ===

export APP=$1
export BRANCH=$2
export DBTYPE=$3

# A URL where your application can be seen (you can use variables here, escaping the $)
export BASEURL="http://localhost/git/\${APP}-\${BRANCH}"

# Validate the app
case "$APP" in
	"ojs") ;;
	"omp") ;;
	"ops") ;;
	*) echo "Unknown app specified in first parameter."; return -1 ;;
esac

# Validate the branch
case "$BRANCH" in
	"main") ;;
	"stable") ;;
	"stable-3_1_2") ;;
	"stable-3_3_1") ;;
	"stable-3_3_0") ;;
	"stable-3_2_1") ;;
	"stable-3_2_0") ;;
	*) echo "Unknown branch specified in second parameter."; return -1 ;;
esac

# Validate the database type, setting default to MySQL if needed
case "$DBTYPE" in
	"MySQL" | "" | "MySQLi")
		export DBTYPE=MySQLi
		export DBTYPE_SYMBOLIC=mysql
		;;
	"PostgreSQL")
		export DBTYPE_SYMBOLIC=pgsql
		;;
	*) echo "Unknown database type specified in third parameter."; return -1 ;;
esac

# The BASEURL may contain variable names. Eval them to values.
export BASEURL=`eval echo ${BASEURL}`

# Set up the rest of the variables needed for the tests.
export DBHOST=127.0.0.1
export DBNAME=${APP}-${BRANCH}
export DBUSERNAME=${APP}-ci
export DBPASSWORD=${APP}-ci
export FILESDIR=files

# Export Cypress equivalents
export CYPRESS_baseUrl=${BASEURL}
export CYPRESS_DBTYPE=${DBTYPE}
export CYPRESS_DBUSERNAME=${DBUSERNAME}
export CYPRESS_DBNAME=${DBNAME}
export CYPRESS_DBPASSWORD=${DBPASSWORD}
export CYPRESS_DBHOST=${DBHOST}
export CYPRESS_FILESDIR=${FILESDIR}
