FROM walberla/buildenv-ubuntu-basic:16.04

RUN apt-get update &&  apt-get install  -y \
    software-properties-common \
 && add-apt-repository ppa:ubuntu-toolchain-r/test \
 && apt-get purge -y software-properties-common \
 && apt-get autoremove -y  \ 
 && apt-get update &&  apt-get install  -y \
    gcc-6 \
    g++-6 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 999 \
 && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 999 \
 && update-alternatives --install /usr/bin/cc  cc  /usr/bin/gcc-6 999 \
 && update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-6 999

ENV CC="ccache gcc" CXX="ccache g++" 
