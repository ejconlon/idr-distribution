#!/bin/bash

# Runs our build script in the docker container
# EXAMPLE: PLATFORM=debian/stretch COMMAND="bash ./scripts/build.sh "./scripts/command.sh

set -eux

: "${PLATFORM?}"
: "${COMMAND?}"

TAG="ejconlon/idr-packaging-$(echo ${PLATFORM} | tr / -)"

DIR=$(cd $(dirname "${BASH_SOURCE[0]}")/.. && pwd)

WORKSPACE="${DIR}/workspace"

if [ -f ${WORKSPACE}/platform ]; then
  PREV_PLATFORM="$(cat ${WORKSPACE}/platform)"
  if [ "${PREV_PLATFORM}" != "${PLATFORM}" ]; then
    echo "Need to clean workspace: ${PREV_PLATFORM} detected"
    exit 1
  fi
else
  echo "${PLATFORM}" > ${WORKSPACE}/platform
fi

rm -rf ${WORKSPACE}/scripts
mkdir ${WORKSPACE}/scripts
cp common/* ${WORKSPACE}/scripts
cp ${PLATFORM}/scripts/* ${WORKSPACE}/scripts

docker run -it -v ${WORKSPACE}:/workspace -P ${TAG} bash -c "cd /workspace && ${COMMAND}"
