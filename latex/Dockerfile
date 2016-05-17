FROM ubuntu:16.04
MAINTAINER Christian Godenschwager "christian.godenschwager@fau.de"

RUN apt-get update &&  apt-get install  -y \
    curl \
    texlive-full \
    gdebi \
    git \
    gnuplot \
    python-matplotlib \
    make \
 && curl -O http://de.archive.ubuntu.com/ubuntu/pool/universe/b/biber/biber_2.4-1_all.deb \
 && gdebi -n biber_2.4-1_all.deb \
 && rm biber_2.4-1_all.deb \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

