#!/bin/bash

set -eux

MAINTAINER_NAME="Eric Conlon"
MAINTAINER_EMAIL="ejconlon@gmail.com"

VERSION="$(cat version)"
RELEASE_DIR="/workspace/packaging/idris"

rm -rf ${RELEASE_DIR}
mkdir -p ${RELEASE_DIR}
cd ${RELEASE_DIR}
mkdir -p DEBIAN

cat << EOF > DEBIAN/control
Package: idris
Architecture: amd64
Maintainer: ${MAINTAINER_NAME} <${MAINTAINER_EMAIL}>
Priority: extra
Version: ${VERSION}
Depends: libffi-dev, libgmp-dev
Homepage: http://www.idris-lang.org/
Description: Compiler for the Idris programming language
	Read more at https://raw.githubusercontent.com/idris-lang/Idris-dev/v${VERSION}/README.md .
	Packaged with https://github.com/ejconlon/idr-distribution .
EOF

cp /workspace/Idris-dev/LICENSE DEBIAN/copyright

cat << EOF > DEBIAN/changelog
idris (${VERSION}) unstable; urgency=low

  * See https://raw.githubusercontent.com/idris-lang/Idris-dev/v${VERSION}/CHANGELOG.md .

 -- ${MAINTAINER_NAME} <${MAINTAINER_EMAIL}>  $(date -R)
EOF

cat << EOF > DEBIAN/postinst
#!/bin/bash
set -e
EOF

for BINARY in $(ls /workspace/dist/bin); do
  echo "ln -sf /opt/idris-${VERSION}/bin/${BINARY} /usr/local/bin/${BINARY}" >> DEBIAN/postinst
done

chmod +x DEBIAN/postinst

INSTALL_PATH="opt/idris-${VERSION}"
mkdir -p ${INSTALL_PATH}
pushd ${INSTALL_PATH}
  cp -r /workspace/dist/* ./
popd

cd ..

dpkg-deb --build idris

mv idris.deb idris_${VERSION}_amd64.deb

dpkg -c idris_${VERSION}_amd64.deb
