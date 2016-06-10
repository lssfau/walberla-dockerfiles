FROM walberla/buildenv-ubuntu-basic:16.04

RUN apt-get update &&  apt-get install  -y \
    clang-3.8 \
    libomp-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 

RUN update-alternatives --install /usr/bin/clang   clang   /usr/bin/clang-3.8 999 \
 && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.8 999 \
 && update-alternatives --install /usr/bin/cc  cc  /usr/bin/clang-3.8 999 \
 && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-3.8 999

ENV CC="ccache clang" CXX="ccache clang++"
