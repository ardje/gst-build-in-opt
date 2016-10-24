#!/bin/bash -x
. ./set_env.sh
mkdir -p $PFX
cd gst-plugins-base
git clean -x -d -f
git checkout 1.9.90
export CONFIGURE_EXT_OPT="--prefix=$PFX --enable-introspection=yes"
./autogen.sh
make
make install
