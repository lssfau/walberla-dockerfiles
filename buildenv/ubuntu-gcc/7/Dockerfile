FROM walberla/buildenv-ubuntu-basic:17.04

RUN apt-get update \
 && apt-get install -y software-properties-common \
 && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
 && apt-get update \
 && apt-get install -y gcc-7 g++-7 \
 && rm -rf /var/lib/apt/lists/* 

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 999 \
 && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 999 \
 && update-alternatives --install /usr/bin/cc  cc  /usr/bin/gcc-7 999 \
 && update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-7 999
 
ENV CC="ccache gcc" CXX="ccache g++" 
