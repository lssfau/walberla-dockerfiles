FROM walberla/buildenv-opensuse-basic
MAINTAINER Martin Bauer "martin.bauer@fau.de"

RUN zypper -n --gpg-auto-import-keys refresh && \
    zypper -n --gpg-auto-import-keys install \
                python3-devel \
                python3-numpy \
                python3-matplotlib \ 
                wget

# Build custom boost with Python3 support
RUN cd /opt \
 && wget http://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.tar.bz2 -O - | tar xj \
 && cd /opt/boost_1_59_0 \
 && ./bootstrap.sh --with-toolset=gcc --with-python=/usr/bin/python3 --with-python-root=/usr/ \
 && ./b2 -j $(nproc) toolset=gcc link=shared install \
 && cd /opt \
 && rm -rf boost*
 
ENV BOOST_ROOT /usr/local