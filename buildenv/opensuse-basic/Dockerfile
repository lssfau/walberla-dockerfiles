FROM opensuse:13.2
MAINTAINER Martin Bauer "martin.bauer@fau.de"


RUN zypper -n --gpg-auto-import-keys refresh && \
    zypper -n --gpg-auto-import-keys install \
                patterns-openSUSE-devel_C_C++ \
                ccache \
                cmake \
                git \
                boost-devel \
                libboost_filesystem1_54_0 \
                libboost_regex1_54_0 \
                libboost_system1_54_0 \
                libboost_thread1_54_0 \
                openmpi-devel
                
ENV CCACHE_DIR=/ccache
