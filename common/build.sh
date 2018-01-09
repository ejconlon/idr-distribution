#!/bin/bash

set -eux

cd Idris-dev

cabal sandbox init
cabal update

FLAGS="-f FFI -f release"

cabal install --prefix=/workspace/dist ${FLAGS}
