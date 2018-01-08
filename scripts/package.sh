#!/bin/bash

# Runs our package script in the docker container
# EXAMPLE: PLATFORM=debian/stretch ./scripts/package.sh

set -eux

: "${PLATFORM?}"

COMMAND="bash ./scripts/package.sh" ./scripts/command.sh
