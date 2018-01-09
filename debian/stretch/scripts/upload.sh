#!/bin/bash

# LOCAL SCRIPT: uploads the deb to a github release

set -eux

: "${GITHUB_TOKEN?}"
: "${VERSION?}"

GITHUB_USERNAME="${GITHUB_USERNAME:-ejconlon}"
GITHUB_REPO="${GITHUB_REPO:-idr-distribution}"

github-release upload \
    --user ${GITHUB_USERNAME} \
    --repo ${GITHUB_REPO} \
    --tag v${VERSION} \
    --name idris_${VERSION}_amd64.deb \
    --file workspace/packaging/idris_${VERSION}_amd64.deb
