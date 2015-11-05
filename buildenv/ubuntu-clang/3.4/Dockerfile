FROM walberla/buildenv-ubuntu-basic

ENV VERSION=3.4.2 VERSION_NO_BUGFIX=3.4 BASEPATH=/usr/src/clang

RUN buildDeps='python2.7 wget' \
	&& set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends \
	&& rm -r /var/lib/apt/lists/* \
	&& mkdir -p $BASEPATH \
   && mkdir -p ${BASEPATH}/tools/clang/tools/extra \
   && mkdir -p ${BASEPATH}/projects/compiler-rt \
   && wget http://llvm.org/releases/${VERSION}/llvm-${VERSION}.src.tar.gz -O - | tar -x -z --strip-components 1 -C ${BASEPATH} \
   && wget http://llvm.org/releases/${VERSION}/cfe-${VERSION}.src.tar.gz -O - | tar -x -z --strip-components 1 -C ${BASEPATH}/tools/clang \
   && wget http://llvm.org/releases/${VERSION_NO_BUGFIX}/compiler-rt-${VERSION_NO_BUGFIX}.src.tar.gz -O - | tar -x -z --strip-components 1 -C ${BASEPATH}/projects/compiler-rt \
   && wget http://llvm.org/releases/${VERSION_NO_BUGFIX}/clang-tools-extra-${VERSION_NO_BUGFIX}.src.tar.gz -O - | tar -x -z --strip-components 1 -C ${BASEPATH}/tools/clang/tools/extra \
	&& dir="$(mktemp -d)" \
	&& cd "$dir" \
	&& cmake $BASEPATH \
	&& make -j"$(nproc)" \
	&& make install \
	&& cd .. \
	&& rm -rf "$dir" \
	&& apt-get purge -y --auto-remove $buildDeps

ENV CC=clang CXX=clang++

RUN set -x \
	&& update-alternatives --install /usr/bin/cc cc /usr/local/bin/clang 999 \
   && update-alternatives --install /usr/bin/cxx cxx /usr/local/bin/clang++ 999
