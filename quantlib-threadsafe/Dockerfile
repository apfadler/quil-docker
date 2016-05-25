FROM lballabio/boost
MAINTAINER Andreas Pfadler <andreas.pfadler@gmail.com>
LABEL Description="QuantLib C++ library with thread safe observer pattern and sessions"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y git automake libtool \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ARG quantlib_version=1.7
ENV quantlib_version ${quantlib_version}

RUN git clone https://github.com/apfadler/QuantLib.git \
    && cd QuantLib && git checkout v1.7.x \
    && sh ./autogen.sh && ./configure --prefix=/usr --disable-static CXXFLAGS=-O3  --enable-thread-safe-observer-pattern --enable-sessions \
    && make -j 4 && make install \
    && cd .. && rm -rf QuantLib-${quantlib_version} && ldconfig

CMD bash