#!/bin/bash

set -eux

cd Idris-dev

cabal sandbox init
cabal update

FLAGS="-f GMP -f FFI -f release -f freestanding --disable-documentation --disable-profiling --disable-library-profiling"

echo "CABALFLAGS += ${FLAGS}" > custom.mk

export IDRIS_LIB_DIR="./libs"

make

rm -rf /workspace/dist
mkdir /workspace/dist

cabal install --prefix=/workspace/dist ${FLAGS}
