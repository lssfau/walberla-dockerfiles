FROM ubuntu:16.04
MAINTAINER Christian Godenschwager "christian.godenschwager@fau.de"

RUN apt-get update &&  apt-get install  -y \
    texlive-full \
    git \
    gnuplot \
    python-matplotlib \
    make \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

