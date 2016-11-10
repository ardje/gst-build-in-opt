#!/bin/bash -ex
. ./set_env.sh

if ! test -d $PFX; then
	sudo bash -c "mkdir -p $PFX;chown $(id -u):$(id -g) $PFX"
fi

./do_checkconfig.sh
./do_orc.sh
#wget -c https://www.khronos.org/registry/khronos_headers.tgz
#tar xvzf khronos_headers.tgz -C $PFX/include/ --strip-components=1
./do_x264.sh
./do_gstreamer.sh
./do_gst-plugins-base.sh
./do_gst-plugins-good.sh
./do_gst-plugins-bad.sh
./do_gst-plugins-ugly.sh

