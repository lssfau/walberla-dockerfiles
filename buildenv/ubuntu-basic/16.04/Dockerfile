FROM ubuntu:16.04
MAINTAINER Martin Bauer "martin.bauer@fau.de"

# OpenSSH is required to run MPI applications
RUN apt-get update &&  apt-get install  -y \
    build-essential \
    ccache \
    cmake \ 
    git \
    libboost-dev \
    libboost-filesystem-dev \
    libboost-regex-dev \
    libboost-system-dev \
    libboost-thread-dev \
    libopenmpi-dev \
    openmpi-bin \
    openmpi-common  \
    openssh-client \  
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 

ENV CCACHE_DIR=/ccache
