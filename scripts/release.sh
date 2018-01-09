#!/bin/bash

# Start release process
# EXAMPLE: VERSION=1.2.0 ./scripts/release.sh

set -eux

: "${GITHUB_TOKEN?}"
: "${VERSION}"

GITHUB_USERNAME="${GITHUB_USERNAME:-ejconlon}"
GITHUB_REPO="${GITHUB_REPO:-idr-distribution}"

github-release release \
    --user ${GITHUB_USERNAME} \
    --repo ${GITHUB_REPO} \
    --tag v${VERSION} \
    --pre-release
