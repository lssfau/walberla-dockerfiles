FROM walberla/buildenv-ubuntu-basic:17.04

RUN add-apt-repository ppa:ubuntu-toolchain-r/test \
 && apt-get update \
 && apt-get install gcc-7 \
 && rm -rf /var/lib/apt/lists/* 

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7.1 999 \
 && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7.1 999 \
 && update-alternatives --install /usr/bin/cc  cc  /usr/bin/gcc-7.1 999 \
 && update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-7.1 999
 
ENV CC="ccache gcc" CXX="ccache g++" 
