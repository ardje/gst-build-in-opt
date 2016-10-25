#!/bin/bash -x
APT=$(which aptitude) || APT=$(which apt-get)
apt_install() {
	sudo $APT install "$@"
}
apt_install autoreconf
