#!/bin/bash

# Load the files and database parts of the application environment.
# Your environment must be configured first using the environment.sh script.
#
# You can optionally specify a branch as the first parameter; this is useful
# if you're testing upgrades, i.e. you're working with OJS 3.4.0 but want to
# load a dataset from an earlier version.

set -e

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

DATA_BRANCH=$1

# Reload both the database and files environments.
${SCRIPT_DIR}/loaddb.sh $1
${SCRIPT_DIR}/loadfiles.sh $1
