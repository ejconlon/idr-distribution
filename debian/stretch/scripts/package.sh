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

cat << EOF > debian/control
Source: idris
Section: Development
Maintainer: ${MAINTAINER_NAME} <${MAINTAINER_EMAIL}>
Build-Depends: debhelper (>= 10.0.0)
Standards-Version: 3.9.3

Package: idris
Priority: extra
Architecture: amd64
Depends: libffi-dev
Homepage: http://www.idris-lang.org/
Description: Compiler for the Idris programming language
EOF

cp /workspace/Idris-dev/LICENSE debian/copyright

cat << EOF > debian/changelog
idris (1.2.0) unstable; urgency=low

  * See https://raw.githubusercontent.com/idris-lang/Idris-dev/v$(cat /workspace/version)/CHANGELOG.md .

 -- ${MAINTAINER_NAME} <${MAINTAINER_EMAIL}>  $(date -R)
EOF

cat << EOF > debian/rules
#!/usr/bin/make -f
%:
	dh \$@
EOF

cat << EOF > debian/compat
10
EOF

# cat << EOF > Makefile
# install:
# 	echo "hi"
# EOF

# debuild -us -uc
