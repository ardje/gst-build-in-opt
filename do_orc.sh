#!/bin/bash -x
. ./set_env.sh
mkdir -p $PFX
cd orc
git clean -x -d -f
git checkout orc-0.4.26
export CONFIGURE_EXT_OPT="--prefix=$PFX --enable-introspection=yes"
./autogen.sh
make
