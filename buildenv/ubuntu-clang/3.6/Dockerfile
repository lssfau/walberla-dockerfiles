FROM walberla/buildenv-ubuntu-basic

RUN apt-get update &&  apt-get install  -y \
    clang-3.6 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 

# Build custom boost with Python3 support
RUN cd /opt \
 && wget http://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.bz2 -O - | tar xj \
 && cd /opt/boost_1_59_0 \
 && ./bootstrap.sh --with-python=/usr/bin/python3.5 --with-python-root=/usr/ \
 && ./b2 -j $(nproc) link=shared install \
 && cd /opt \
 && rm -rf boost*

ENV CC="ccache clang" CXX="ccache clang++"
