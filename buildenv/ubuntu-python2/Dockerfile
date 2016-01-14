FROM walberla/buildenv-ubuntu-basic
MAINTAINER Martin Bauer "martin.bauer@fau.de"


RUN apt-get update &&  apt-get install  -y \
    python-dev \
    python-numpy \
    libboost-python-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 