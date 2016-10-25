#!/bin/bash
. ./set_env.sh

if ! test -d $PFX; then
	sudo "mkdir -p $PFX;chown $(id -u):$(id -g) $PFX"
fi

./do_orc.sh
