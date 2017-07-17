#!/bin/sh -e

OPENMESH_VERSION=6.3
TMP="/tmp/openmesh-$OPENMESH_VERSION"
mkdir $TMP
cd $TMP

curl -L https://www.openmesh.org/media/Releases/6.3/OpenMesh-6.3.tar.bz2 | tar xj
cd OpenMesh-$OPENMESH_VERSION
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_APPS=OFF CMAKE_INSTALL_PREFIX=/opt/openmesh ..
make -j `nproc`
make -j `nproc` install

cd && rm -rf $TMP

