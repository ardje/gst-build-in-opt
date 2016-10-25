#!/bin/bash -ex
. ./set_env.sh

if ! test -d $PFX; then
	sudo bash -c "mkdir -p $PFX;chown $(id -u):$(id -g) $PFX"
fi

./do_checkconfig.sh
./do_orc.sh
