FROM ubuntu:15.10
MAINTAINER Martin Bauer "martin.bauer@fau.de"

# OpenSSH is required to run MPI applications
RUN apt-get update && apt-get upgrade -y &&  apt-get install  -y \
               build-essential \
               cmake \ 
               openmpi-common  \
               git \
               libopenmpi-dev \
               openmpi-bin \
               openssh-client \  
               python3.5-dev

# Build custom boost with Python3 support
ADD http://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.bz2 /opt/
WORKDIR /opt/boost_1_59_0
RUN cd /opt ; \
    tar xf boost_1_59_0.tar.bz2; \
    cd /opt/boost_1_59_0; \
    ./bootstrap.sh --with-toolset=gcc --with-python=/usr/bin/python3.5 --with-python-root=/usr/; \
    ./b2 -j 2 link=shared toolset=gcc install; \
    rm -rf /opt/boost*

