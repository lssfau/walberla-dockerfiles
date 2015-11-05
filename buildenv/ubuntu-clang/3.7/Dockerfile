FROM walberla/buildenv-ubuntu-basic

ENV VERSION 3.7.0
ENV BASEPATH /usr/src/clang

RUN buildDeps='python2.7 wget' \
	&& set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends \
	&& rm -r /var/lib/apt/lists/* \
	&& mkdir -p $BASEPATH \
   && mkdir -p ${BASEPATH}/tools/clang/tools/extra \
   && mkdir -p ${BASEPATH}/projects/compiler-rt \
   && wget http://llvm.org/releases/${VERSION}/llvm-${VERSION}.src.tar.xz -O - | tar -x -J --strip-components 1 -C ${BASEPATH} \
   && wget http://llvm.org/releases/${VERSION}/cfe-${VERSION}.src.tar.xz -O - | tar -x -J --strip-components 1 -C ${BASEPATH}/tools/clang \
   && wget http://llvm.org/releases/${VERSION}/compiler-rt-${VERSION}.src.tar.xz -O - | tar -x -J --strip-components 1 -C ${BASEPATH}/projects/compiler-rt \
   && wget http://llvm.org/releases/${VERSION}/clang-tools-extra-${VERSION}.src.tar.xz -O - | tar -x -J --strip-components 1 -C ${BASEPATH}/tools/clang/tools/extra \
	&& dir="$(mktemp -d)" \
	&& cd "$dir" \
	&& cmake $BASEPATH \
	&& make -j"$(nproc)" \
	&& make install \
	&& cd .. \
	&& rm -rf "$dir" \
	&& apt-get purge -y --auto-remove $buildDeps

ENV CC  clang
ENV CXX clang++
