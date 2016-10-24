#!/bin/bash -x
. ./set_env.sh
wget -c https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-$VER.tar.xz
wget -c https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-$VER.tar.xz.sha256sum
wget -c https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-$VER.tar.xz
wget -c https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-$VER.tar.xz.sha256sum
