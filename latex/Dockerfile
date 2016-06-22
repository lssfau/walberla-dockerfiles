FROM ubuntu:16.04
MAINTAINER Christian Godenschwager "christian.godenschwager@fau.de"

ADD proposed.list /etc/apt/sources.list.d/proposed.list
ADD proposed-updates /etc/apt/preferences.d/proposed-updates
ADD 01_nodoc /etc/dpkg/dpkg.cfg.d/01_nodoc

RUN apt-get update && apt-get install  -y \
    biber/xenial-proposed \
    curl \
    texlive-full \
    git \
    gnuplot \
    python-matplotlib \
    make \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

