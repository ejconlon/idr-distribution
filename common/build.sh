#!/bin/bash

set -eux

cd Idris-dev

cabal sandbox init
cabal update

echo "CABALFLAGS += -f GMP -f FFI -f release --disable-documentation --disable-profiling --disable-library-profiling" > custom.mk

make

cabal install --prefix=/workspace/dist
