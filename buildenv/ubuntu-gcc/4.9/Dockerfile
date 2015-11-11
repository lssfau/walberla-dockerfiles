FROM walberla/buildenv-ubuntu-basic

RUN apt-get update &&  apt-get install  -y \
    gcc-4.9 \
    g++-4.9 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 999 \
 && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 999 \
 && update-alternatives --install /usr/bin/cc  cc  /usr/bin/gcc-4.9 999 \
 && update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-4.9 999

# Build custom boost with Python3 support
RUN cd /opt \
 && wget http://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.bz2 -O - | tar xj \
 && cd /opt/boost_1_59_0 \
 && ./bootstrap.sh --with-toolset=gcc --with-python=/usr/bin/python3.5 --with-python-root=/usr/ \
 && ./b2 -j $(nproc) toolset=gcc link=shared install \
 && cd /opt \
 && rm -rf boost*

ENV CC="ccache gcc" CXX="ccache g++" 
