FROM ubuntu:16.04
MAINTAINER Christian Godenschwager "christian.godenschwager@fau.de"

RUN apt-get update && apt-get install  -y \
    curl \
    texlive-full \
    git \
    gnuplot \
    python-matplotlib \
    make \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
 
RUN curl -L http://downloads.sourceforge.net/project/biblatex-biber/biblatex-biber/2.4/binaries/Linux/biber-linux_x86_64.tar.gz | tar xz \
 && mv ./biber /usr/bin/

