#!/bin/bash -x
. ./set_env.sh
mkdir -p $PFX
cd gstreamer
git clean -x -d -f
git checkout 1.10
export CONFIGURE_EXT_OPT="--prefix=$PFX --enable-introspection=yes"
./autogen.sh
make
make install
