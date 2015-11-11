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
