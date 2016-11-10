#!/bin/bash -x
. ./set_env.sh
mkdir -p $PFX
cd gst-plugins-ugly
git clean -x -d -f
git checkout 1.10
export CONFIGURE_EXT_OPT="--prefix=$PFX --enable-introspection=yes --enable-v4l2-probe"
./autogen.sh
make
make install
