FROM walberla/buildenv-ubuntu-basic

RUN apt-get update &&  apt-get install  -y \
    clang-3.4 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 

RUN update-alternatives --install /usr/bin/clang   clang   /usr/bin/clang-3.4 999 \
 && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.4 999 \
 && update-alternatives --install /usr/bin/cc  cc  /usr/bin/clang-3.4 999 \
 && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-3.4 999

# Build custom boost with Python3 support
RUN cd /opt \
 && wget http://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.bz2 -O - | tar xj \
 && cd /opt/boost_1_59_0 \
 && ./bootstrap.sh --with-toolset=clang --with-python=/usr/bin/python3.5 --with-python-root=/usr/ \
 && ./b2 -j $(nproc) toolset=clang link=shared install \
 && cd /opt \
 && rm -rf boost*
 
ENV CC="ccache clang" CXX="ccache clang++"