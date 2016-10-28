#!/bin/bash -x
. ./set_env.sh
mkdir -p $PFX
cd x264
git clean -x -d -f
git pull
export CONFIGURE_EXT_OPT="--prefix=$PFX --enable-shared"
./configure $CONFIGURE_EXT_OPT
make
make install
