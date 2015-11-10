FROM walberla/buildenv-ubuntu-basic

RUN apt-get update &&  apt-get install  -y \
    clang-3.7 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 

RUN update-alternatives --install /usr/bin/clang   clang   /usr/bin/clang-3.7 999 \
 && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.7 999 \
 && update-alternatives --install /usr/bin/cc  cc  /usr/bin/clang-3.7 999 \
 && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-3.7 999

