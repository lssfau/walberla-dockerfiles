FROM walberla/buildenv-ubuntu-basic

RUN apt-get update &&  apt-get install  -y \
    gcc-4.8 \
    g++-4.8 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 999 \
 && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 999 \
 && update-alternatives --install /usr/bin/cc  cc  /usr/bin/gcc-4.8 999 \
 && update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-4.8 999

ENV CC="ccache gcc" CXX="ccache g++" 
