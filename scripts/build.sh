#!/bin/bash

# Runs our build script in the docker container
# EXAMPLE: PLATFORM=debian/stretch ./scripts/build.sh

set -eux

: "${PLATFORM?}"

COMMAND="bash ./scripts/build.sh" ./scripts/command.sh
