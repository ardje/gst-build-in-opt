#!/bin/bash -x
APT=$(which aptitude) || APT=$(which apt-get)
apt_install() {
	sudo $APT install "$@"
}

# generic
apt_install autoconf libtool

# gstreamer
apt_install autopoint bison
