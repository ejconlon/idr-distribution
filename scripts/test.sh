#!/bin/bash

# Runs our test script in the docker container
# EXAMPLE: PLATFORM=debian/stretch ./scripts/test.sh

set -eux

: "${PLATFORM?}"

COMMAND="bash ./scripts/test.sh" ./scripts/command.sh
