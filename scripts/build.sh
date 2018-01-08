#!/bin/bash

# Runs our build script in the docker container
# EXAMPLE: ./scripts/build.sh debian/stretch

set -eu

PLATFORM="$1"

TAG="ejconlon/idr-packaging-$(echo ${PLATFORM} | tr / -)"

DIR=$(cd $(dirname "${BASH_SOURCE[0]}")/.. && pwd)

WORKSPACE="${DIR}/workspace"

rm -rf ${WORKSPACE}/scripts
cp -r ${PLATFORM}/scripts ${WORKSPACE}/scripts

docker run -it -v ${WORKSPACE}:/workspace -P ${TAG} bash /workspace/scripts/build.sh
