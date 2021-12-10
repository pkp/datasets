#!/bin/bash

# Load the files and database parts of the application environment.
# Your environment must be configured first using the environment.sh script.

set -e

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Reload both the database and files environments.
${SCRIPT_DIR}/loaddb.sh
${SCRIPT_DIR}/loadfiles.sh
