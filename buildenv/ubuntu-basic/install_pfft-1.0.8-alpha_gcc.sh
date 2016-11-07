#!/bin/sh -e

myprefix="/opt"
PFFT_VERSION=1.0.8-alpha
FFTW_VERSION=3.3.4
INSTDIR=$myprefix/pfft-$PFFT_VERSION
FFTWDIR=$myprefix/fftw-$FFTW_VERSION
TMP="${PWD}/tmp-pfft-$PFFT_VERSION"
LOGFILE="${TMP}/build.log"

# bash check if directory exists
if [ -d $TMP ]; then
        echo "Directory $TMP already exists. Delete it? (y/n)"
	read answer
	if [ ${answer} = "y" ]; then
		rm -rf $TMP
	else
		echo "Program aborted."
		exit 1
	fi
fi

mkdir $TMP && cd $TMP

curl -L http://www.tu-chemnitz.de/~potts/workgroup/pippig/software/pfft-$PFFT_VERSION.tar.gz | tar xz
cd pfft-$PFFT_VERSION

./configure --prefix=$INSTDIR --disable-shared \
  CPPFLAGS="-I$FFTWDIR/include" \
  LDFLAGS="-L$FFTWDIR/lib -L$FFTWDIR/lib64" \
  FC=mpif90 CC=mpicc MPICC=mpicc MPIFC=mpif90 2>&1 | tee $LOGFILE

make -j 4 2>&1 | tee -a $LOGFILE
make install 2>&1 | tee -a $LOGFILE

cd && rm -rf $TMP

