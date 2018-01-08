#!/bin/bash

set -eux

cd Idris-dev

cabal sandbox init
cabal update

FLAGS="-f FFI -f release"

cabal install --only-dependencies ${FLAGS}

cabal install --prefix=/workspace/idris-$(cat ../version) ${FLAGS}
