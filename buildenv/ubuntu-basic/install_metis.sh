#!/bin/sh -e

METIS_VERSION=5.1.0
TMP="/tmp/metis-$METIS_VERSION"
mkdir $TMP
cd $TMP

curl -L http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/metis-$METIS_VERSION.tar.gz | tar xz
cd metis-$METIS_VERSION
sed -i 's/#define IDXTYPEWIDTH 32/#define IDXTYPEWIDTH 64/' include/metis.h
sed -i 's/#define REALTYPEWIDTH 32/#define REALTYPEWIDTH 64/' include/metis.h
make config prefix=/opt/metis
make -j `nproc`
make -j `nproc` install

cd && rm -rf $TMP

