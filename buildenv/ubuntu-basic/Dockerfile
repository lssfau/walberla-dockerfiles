FROM ubuntu:15.10
MAINTAINER Martin Bauer "martin.bauer@fau.de"

# OpenSSH is required to run MPI applications
RUN apt-get update &&  apt-get install  -y \
    build-essential \
    ccache \
    cmake \ 
    git \
    libbz2-dev \
    libopenmpi-dev \
    openmpi-bin \
    openmpi-common  \
    openssh-client \  
    python3.5-dev \
    wget \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 

ENV CCACHE_DIR=/ccache 

# Build custom boost with Python3 support
RUN cd /opt \
 && wget http://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.bz2 -O - | tar xj \
 && cd /opt/boost_1_59_0 \
 && ./bootstrap.sh --with-toolset=gcc --with-python=/usr/bin/python3.5 --with-python-root=/usr/ \
 && ./b2 -j $(nproc) link=shared toolset=gcc install \
 && cd /opt \
 && rm -rf boost*
