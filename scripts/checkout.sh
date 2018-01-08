#!/bin/bash

# Checkout Idris-dev into a workspace dir
# EXAMPLE: VERSION=1.2.0 ./scripts/checkout.sh

set -eux

: "${VERSION?}"

CLEAN=${CLEAN:-true}

DIR=$(cd $(dirname "${BASH_SOURCE[0]}")/.. && pwd)

WORKSPACE="${DIR}/workspace"

if [ -d ${WORKSPACE} ]; then
  cd ${WORKSPACE}
  rm -rf scripts
  cd Idris-dev
  if [ ${CLEAN} = true ]; then
    git clean -fdx
  fi
else
  mkdir ${WORKSPACE}
  cd ${WORKSPACE}
  git clone https://github.com/idris-lang/Idris-dev.git
  cd Idris-dev
fi

git checkout v${VERSION}
echo "${VERSION}" > ../version
