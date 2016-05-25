FROM lballabio/boost
MAINTAINER Andreas Pfadler <andreas.pfadler@gmail.com>
LABEL Description="QuantLib C++ library with thread safe observer pattern and sessions"

ARG quantlib_version=1.7
ENV quantlib_version ${quantlib_version}

RUN wget http://downloads.sourceforge.net/project/quantlib/QuantLib/${quantlib_version}/QuantLib-${quantlib_version}.tar.gz \
    && tar xfz QuantLib-${quantlib_version}.tar.gz \
    && rm QuantLib-${quantlib_version}.tar.gz \
    && cd QuantLib-${quantlib_version} \
    && ./configure --prefix=/usr --disable-static CXXFLAGS=-O3  --enable-thread-safe-observer-pattern --enable-sessions \
    && make -j 4 && make install \
    && cd .. && rm -rf QuantLib-${quantlib_version} && ldconfig

CMD bash