#!/bin/bash

set -eux

MAINTAINER_NAME="Eric Conlon"
MAINTAINER_EMAIL="ejconlon@gmail.com"

# dh_make reads maintainer name from a user account, so we create a dummy one
# adduser --no-create-home --disabled-login --gecos "${MAINTAINER_NAME},,,," maintainer

cd idris-$(cat version)

rm -rf debian

# USER=maintainer dh_make -y -s -n -c custom --copyrightfile /workspace/Idris-dev/LICENSE -e ${MAINTAINER_EMAIL}

mkdir -p debian

cp /workspace/Idris-dev/LICENSE debian/copyright

cat << EOF > debian/control
Section: Development
Priority: optional
Maintainer: ${MAINTAINER_NAME} <${MAINTAINER_EMAIL}>
Standards-Version: 3.9.2

Package: idris
Version: $(cat /workspace/version)
Architecture: amd64
Depends: libffi-dev
Homepage: http://www.idris-lang.org/
Description: Compiler for the Idris programming language
EOF
