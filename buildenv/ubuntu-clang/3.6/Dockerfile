FROM walberla/buildenv-ubuntu-basic

RUN apt-get update &&  apt-get install  -y \
    clang-3.6 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 

RUN update-alternatives --install /usr/bin/clang   clang   /usr/bin/clang-3.6 999 \
 && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 999 \
 && update-alternatives --install /usr/bin/cc  cc  /usr/bin/clang-3.6 999 \
 && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-3.6 999

