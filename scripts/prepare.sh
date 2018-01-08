#!/bin/bash

# Prepare a docker container to build Idris
# EXAMPLE: ./scripts/prepare.sh debian/stretch

set -eu

PLATFORM="$1"

TAG="ejconlon/idr-packaging-$(echo ${PLATFORM} | tr / -)"

cd ${PLATFORM}/context

docker build -t ${TAG} .
