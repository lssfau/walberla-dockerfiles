FROM ubuntu:15.04
MAINTAINER Martin Bauer "martin.bauer@fau.de"

# OpenSSH is required to run MPI applications
RUN apt-get update &&  apt-get install  -y \
    build-essential \
    cmake \ 
    curl \
    git \
    libboost-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-regex-dev \
    libboost-system-dev \
    libboost-thread-dev \
    libopenmpi-dev \
    openmpi-bin \
    openmpi-common  \
    openssh-client \  
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 

RUN export VERSION=3.3.2 \
 && cd /tmp \
 && curl https://www.samba.org/ftp/ccache/ccache-$VERSION.tar.xz | tar xJ \
 && cd ccache-$VERSION \
 && ./configure \
 && make \
 && make install \
 && cd \
 && rm -r /tmp/ccache-$VERSION
 
ENV CCACHE_DIR=/ccache
