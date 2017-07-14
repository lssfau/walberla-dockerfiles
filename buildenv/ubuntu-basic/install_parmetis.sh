#!/bin/sh -e

PARMETIS_VERSION=4.0.3
TMP="/tmp/parmetis-$PARMETIS_VERSION"
mkdir $TMP
cd $TMP

curl -L http://glaros.dtc.umn.edu/gkhome/fetch/sw/parmetis/parmetis-$PARMETIS_VERSION.tar.gz | tar xz
cd parmetis-$PARMETIS_VERSION
sed -i 's/#define IDXTYPEWIDTH 32/#define IDXTYPEWIDTH 64/' metis/include/metis.h
sed -i 's/#define REALTYPEWIDTH 32/#define REALTYPEWIDTH 64/' metis/include/metis.h
make config prefix=/opt/parmetis
make -j `nproc`
make -j `nproc` install

cd && rm -rf $TMP

