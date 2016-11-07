#!/bin/sh -e

VERSION=3.3.2
cd /tmp
curl https://www.samba.org/ftp/ccache/ccache-$VERSION.tar.xz | tar xJ
cd ccache-$VERSION
./configure
make
make install
cd
rm -r /tmp/ccache-$VERSION