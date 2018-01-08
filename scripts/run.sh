#!/bin/bash

# Runs all steps to build for a platform
# EXAMPLE: ./scripts/run.sh debian/stretch v1.2.0

set -eu

PLATFORM="$1"
VERSION="$2"

./scripts/prepare.sh ${PLATFORM}
./scripts/checkout.sh ${VERSION}
./scripts/build.sh ${PLATFORM} ${VERSION}
