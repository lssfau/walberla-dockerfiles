FROM ubuntu:16.04

MAINTAINER Christian Godenschwager "christian.godenschwager@fau.de"

RUN apt-get update &&  apt-get install  -y \
    build-essential \
    libpcre3-dev \
    curl \ 
    python \
    python-pygments \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir /cfg 

RUN cd /tmp \
 && curl -L https://github.com/danmar/cppcheck/archive/1.77.tar.gz | tar xz \
 && cd cppcheck-1.77 \
 && SRCDIR=build CFGDIR=/cfg HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function" make \
 && SRCDIR=build CFGDIR=/cfg HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function" make install \
 && cd \
 && rm -r /tmp/cppcheck-1.77
 
