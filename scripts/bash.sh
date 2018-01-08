#!/bin/bash

# Runs a command line in the given container
# EXAMPLE: PLATFORM=debian/stretch ./scripts/bash.sh

set -eux

: "${PLATFORM?}"

COMMAND="bash" ./scripts/command.sh
