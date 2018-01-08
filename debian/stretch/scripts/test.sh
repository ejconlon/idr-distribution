#!/bin/bash

set -eux

VERSION="$(cat /workspace/version)"

apt-get update
apt-get install -y libffi-dev libgmp-dev

dpkg -i /workspace/packaging/idris_${VERSION}_amd64.deb

echo ${PATH}
ls /usr/local/bin

RESULT="$(idris --version)"

if [ "${RESULT}" != "${VERSION}" ]; then
  echo "Version mismatch: got ${RESULT}, expected ${VERSION}"
  exit 1
fi
