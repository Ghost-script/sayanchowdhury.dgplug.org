#!/bin/bash
# Get the directory that this script is running from and cd to there
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
echo "Deploying $DIR"
# tell hyde to rebuild whole site to production_deploy and note the
#   script will bail out if hyde returns an error
hyde gen -c prod.yaml -r -d production_deploy/ || exit $?
# copy only changed files to the server
rsync -cvraz --delete production_deploy/* sayanchowdhury@dgplug.org:/home/sayanchowdhury/sayanchowdhury.dgplug.org/
echo "done."
