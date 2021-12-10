#!/bin/bash

# Load the database from a dump contained in this repository.
# Your environment must be configured first using the environment.sh script.
#
# You can optionally specify a branch as the first parameter; this is useful
# if you're testing upgrades, i.e. you're working with OJS 3.4.0 but want to
# load a dataset from an earlier version.

set -e

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

DATA_BRANCH=$1

# If a data branch was not specified, use the application branch.
if [ "${DATA_BRANCH}" == "" ]
then
	DATA_BRANCH="${BRANCH}"
fi

DUMP_FILE="${APP}/${DATA_BRANCH}/${DBTYPE_SYMBOLIC}/database.sql"

# Make sure we have a database dump for what we're supposed to load.
if [ ! -f ${SCRIPT_DIR}/../${DUMP_FILE} ]
then
	echo "Database dump \"${DUMP_FILE}\" does not exist."
	exit 1;
fi

# Recreate an empty DB and load it with the contents of the latest dataset.
echo -n "Loading ${DUMP_FILE} into ${DBNAME}... "
${SCRIPT_DIR}/recreatedb.sh
${SCRIPT_DIR}/dbclient.sh < ${SCRIPT_DIR}/../${DUMP_FILE}
echo "Done."
