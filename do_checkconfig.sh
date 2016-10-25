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


apt_install $PKGS
