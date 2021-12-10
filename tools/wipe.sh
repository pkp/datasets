#!/bin/bash

# Wipe the current CI environment in preparation for a run of the data build script.
# Your environment must be configured first using the environment.sh script.

set -e

if [ ! -f config.TEMPLATE.inc.php ]; then
   echo "This script must be run in the application's installation directory."
   exit 1;
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Recreate an empty DB
${SCRIPT_DIR}/recreatedb.sh

# Remove the cache, public files, and journal files; prep a fresh config file
rm -rf cache/*.css cache/*.php files/* public/*
cp config.TEMPLATE.inc.php config.inc.php
