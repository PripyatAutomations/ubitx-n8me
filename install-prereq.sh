#!/bin/sh
UPSTREAM_VER=1.8.19
[ -x "$(which sudo)" ] && SUDO=sudo

HOST_UNAME=$(uname -m)
[ "${HOST_UNAME}" = "x86_64" ] && HOST_ARCH=linux64
[ "${HOST_UNAME}" = "aarch64" ] && HOST_ARCH=linuxaarch64

UPSTREAM_URL=https://downloads.arduino.cc/arduino-${UPSTREAM_VER}-${HOST_ARCH}.tar.xz

cd /opt

[ ! -f "arduino-${UPSTREAM_VER}-${HOST_ARCH}.tar.xz" ] && {
	${SUDO} wget ${UPSTREAM_URL}
}

[ ! -d arduino-${UPSTREAM_VER} ] && {
	${SUDO} tar xvf arduino-${UPSTREAM_VER}-${HOST_ARCH}.tar.xz
}

[ -L /opt/arduino ] && {
	${SUDO} rm -r /opt/arduino
}
${SUDO} ln -s /opt/arduino-${UPSTREAM_VER} /opt/arduino
