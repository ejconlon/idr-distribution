#!/bin/bash

# Build and test and image that is an example of consuming a published artifact
# EXAMPLE: PLATFORM=debian/stretch VERSION=1.2.0 ./scripts/example.sh

set -eux

: "${PLATFORM?}"
: "${VERSION}"

TAG="ejconlon/idr-example-$(echo ${PLATFORM} | tr / -)"

cd ${PLATFORM}/example

docker build --build-arg VERSION=${VERSION} -t ${TAG} .

RESULT="$(docker run -it -P ${TAG} idris --version | sed -e 's/[^0-9]$//')"

if [ "${RESULT}" != "${VERSION}" ]; then
  echo "Version mismatch: got ${RESULT}, expected ${VERSION}"
  exit 1
fi
