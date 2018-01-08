#!/bin/bash

set -eux

cd Idris-dev

cabal sandbox init
cabal update

echo "CABALFLAGS += -f FFI -f GMP" > custom.mk

make
