#!/bin/bash

# Load the database from a dump contained in this repository.
# Your environment must be configured first using the environment.sh script.

set -e

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Recreate an empty DB and load it with the contents of the latest dataset.
${SCRIPT_DIR}/recreatedb.sh
${SCRIPT_DIR}/dbclient.sh < ${SCRIPT_DIR}/../${APP}/${BRANCH}/${DBTYPE_SYMBOLIC}/database.sql
