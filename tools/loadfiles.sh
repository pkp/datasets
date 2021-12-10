#!/bin/bash

# Load the file set from a dump contained in this repository.
# Your environment must be configured first using the environment.sh script.

set -e

if [ ! -f config.TEMPLATE.inc.php ]; then
   echo "This script must be run in the application's installation directory."
   exit 1;
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Recreate the file environment from the dataset.
cp -rf ${SCRIPT_DIR}/../${APP}/${BRANCH}/${DBTYPE_SYMBOLIC}/files/* files/
cp -rf ${SCRIPT_DIR}/../${APP}/${BRANCH}/${DBTYPE_SYMBOLIC}/public/* public/
cp -rf ${SCRIPT_DIR}/../${APP}/${BRANCH}/${DBTYPE_SYMBOLIC}/config.inc.php config.inc.php
sed -i -e "s/^name = ${APP}-ci$/name = ${APP}-${BRANCH}/" config.inc.php

# Clean out cache files in order to avoid stale data.
rm -rf cache/*.php cache/*.css
