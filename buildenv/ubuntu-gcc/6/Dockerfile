FROM walberla/buildenv-ubuntu-basic:16.04

RUN apt-get update &&  apt-get install  -y \
    software-properties-common \
 && add-apt-repository ppa:ubuntu-toolchain-r/test \
 && apt-get purge -y software-properties-common \
 && apt-get autoremove -y  \ 
 && apt-get update &&  apt-get install  -y \
    gcc-6 \
    g++-6 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 999 \
 && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 999 \
 && update-alternatives --install /usr/bin/cc  cc  /usr/bin/gcc-6 999 \
 && update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-6 999
 
RUN cd /tmp \
 && mkdir boost \
 && cd boost \
 && curl -L http://downloads.sourceforge.net/project/boost/boost/1.62.0/boost_1_62_0.tar.bz2 | tar xj \
 && cd boost_1_62_0 \
 && ./bootstrap.sh \
 && ./b2 -j $(nproc) toolset=gcc-6 --without-python install --prefix=/opt/boost \
 && cd \
 && rm -r /tmp/boost

ENV BOOST_ROOT="/opt/boost"

ENV CC="ccache gcc" CXX="ccache g++" 
