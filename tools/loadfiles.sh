#!/bin/bash

# Load the file set from a dump contained in this repository.
# Your environment must be configured first using the environment.sh script.
#
# You can optionally specify a branch as the first parameter; this is useful
# if you're testing upgrades, i.e. you're working with OJS 3.4.0 but want to
# load a dataset from an earlier version.

set -e

if [ ! -f config.TEMPLATE.inc.php ]; then
   echo "This script must be run in the application's installation directory."
   exit 1;
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

DATA_BRANCH=$1

# If a data branch was not specified, use the application branch.
if [ "${DATA_BRANCH}" == "" ]
then
	DATA_BRANCH="${BRANCH}"
fi

# Make sure we have a database dump for what we're supposed to load.
if [ ! -d ${SCRIPT_DIR}/../${APP}/${DATA_BRANCH}/${DBTYPE_SYMBOLIC}/files ]
then
	echo "File set dump for ${DATA_BRANCH} does not exist."
	exit 1;
fi

echo -n "Copying files... "

# Recreate the file environment from the dataset.
cp -rf ${SCRIPT_DIR}/../${APP}/${DATA_BRANCH}/${DBTYPE_SYMBOLIC}/files/* files/
cp -rf ${SCRIPT_DIR}/../${APP}/${DATA_BRANCH}/${DBTYPE_SYMBOLIC}/public/* public/
cp -rf ${SCRIPT_DIR}/../${APP}/${DATA_BRANCH}/${DBTYPE_SYMBOLIC}/config.inc.php config.inc.php
sed -i -e "s/^name = ${APP}-ci$/name = ${APP}-${BRANCH}/" config.inc.php

# Clean out cache files in order to avoid stale data.
rm -rf cache/*.php cache/*.css

echo "Done."
