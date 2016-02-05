FROM walberla/buildenv-ubuntu-python3
MAINTAINER Martin Bauer "martin.bauer@fau.de"


RUN apt-get update &&  apt-get install  -y \
    python3-pip \
    libedit-dev \
    libz-dev \
    llvm-3.6-dev \
    python3-scipy \
    libzmq3-dev \
    python3-matplotlib \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*  \
 && update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-3.6 99  \
 && pip3 install numba "ipython[notebook]" Cython ipyparallel sympy

 
 
