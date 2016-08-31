FROM ubuntu:16.04

MAINTAINER Sebastian Eibl "sebastian.eibl@fau.de"

RUN apt-get update &&  apt-get install  -y \
    build-essential \
    curl \ 
    python \
    gawk \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN cd /tmp \
 && curl -L http://llvm.org/releases/3.8.1/clang+llvm-3.8.1-x86_64-linux-gnu-ubuntu-16.04.tar.xz | tar xJ \
 && mv clang+llvm-3.8.1-x86_64-linux-gnu-ubuntu-16.04 clang

ADD ansi2html.sh /tmp/ansi2html.sh
ADD run-clang-tidy.py /tmp/ansi2html.run-clang-tidy.py

 
