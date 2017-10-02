#!/bin/bash -xe
. ./set_env.sh
mkdir -p $PFX
cd orc
git clean -x -d -f
git checkout orc-0.4.27
export CONFIGURE_EXT_OPT="--prefix=$PFX --enable-introspection=yes"
NOCONFIGURE=true ./autogen.sh
./configure $CONFIGURE_EXT_OPT
make
make install
