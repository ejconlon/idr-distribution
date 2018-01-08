#!/bin/bash

# Prepare a docker container to build Idris
# EXAMPLE: PLATFORM=debian/stretch ./scripts/prepare.sh

set -eux

: "${PLATFORM?}"

TAG="ejconlon/idr-packaging-$(echo ${PLATFORM} | tr / -)"

cd ${PLATFORM}/context

docker build -t ${TAG} .
