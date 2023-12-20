#!/bin/bash

set -e
set -u

SITE="${SITE:-sfdbi}"

terminus --version

# Export the database to $HOME/pantheon-local-copies/db/${SITE}-db.tgz.
# See: https://docs.pantheon.io/terminus/commands/local-getLiveDB
terminus local:getLiveDB --no-interaction --overwrite -- "${SITE}"

# Export the files to $HOME/pantheon-local-copies/files/${SITE}-files.tgz.
# See: https://docs.pantheon.io/terminus/commands/local-getLiveFiles
terminus local:getLiveFiles --no-interaction --overwrite -- "${SITE}"

# Export the site to $HOME/pantheon-local-copies/${SITE}.
# See: https://docs.pantheon.io/terminus/commands/local-clone
terminus local:clone --no-interaction --override -- "${SITE}"
