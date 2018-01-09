#!/bin/bash

# Release artifacts for a given platform
# EXAMPLE: PLATFORM=debian/stretch VERSION=v1.2.0 ./scripts/upload.sh

set -eux

: "${PLATFORM}"

${PLATFORM}/scripts/upload.sh
