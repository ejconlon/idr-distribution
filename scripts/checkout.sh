#!/bin/bash

# Checkout Idris-dev into a workspace dir
# EXAMPLE: VERSION=v1.2.0 ./scripts/checkout.sh

set -eux

: "${VERSION?}"

DIR=$(cd $(dirname "${BASH_SOURCE[0]}")/.. && pwd)

WORKSPACE="${DIR}/workspace"

if [ -d ${WORKSPACE} ]; then
  cd ${WORKSPACE}
  rm -rf scripts
  cd Idris-dev
  # TODO clean up
  # git clean -fdx
else
  mkdir ${WORKSPACE}
  cd ${WORKSPACE}
  git clone https://github.com/idris-lang/Idris-dev.git
  cd Idris-dev
fi

git checkout ${VERSION}
