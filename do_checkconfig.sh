#!/bin/bash -x
APT=$(which aptitude) || APT=$(which apt-get)
apt_install() {
	sudo $APT install "$@"
}
apt_add() {
	PKGS="$PKGS $@"
}

# generic
apt_add autoconf libtool

# gstreamer
apt_add autopoint bison flex gobject-introspection libgirepository1.0-dev gtk-doc-tools libunwind-dev

#plugins-bad
apt_add libasound2-dev libusb-1.0-0-dev libbluetooth-dev libsbc-dev libwayland-dev ladspa-sdk libass-dev libbs2b-dev libbz2-dev libcairo2-dev libchromaprint-dev libcurl4-gnutls-dev libdca-dev libdirectfb-dev libdrm-dev libegl1-mesa-dev libgles2-mesa-dev libvo-aacenc-dev libvo-amrwbenc-dev libx11-dev libx265-dev libxml2-dev libxvidcore-dev

apt_install $PKGS

