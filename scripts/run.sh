#!/bin/bash

# Runs all steps to build for a platform
# EXAMPLE: PLATFORM=debian/stretch VERSION=1.2.0 ./scripts/run.sh

set -eux

: "${PLATFORM?}"
: "${VERSION?}"

./scripts/prepare.sh
./scripts/checkout.sh
./scripts/build.sh
./scripts/package.sh
./scripts/test.sh
