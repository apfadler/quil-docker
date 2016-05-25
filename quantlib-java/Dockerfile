FROM apfadler/quantlib-threadsafe
MAINTAINER Andreas Pfadler <andreas.pfadler@gmail.com>
LABEL Description="An environment with the QuantLib Java module"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-8-jdk automake swig \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ARG quantlib_swig_version=1.7
ENV quantlib_swig_version ${quantlib_swig_version}

COPY PatchedJavaMakefile.am /PatchedJavaMakefile.am

RUN git clone https://github.com/apfadler/QuantLib-SWIG.git \
	&& cd QuantLib-SWIG && git checkout v1.7.x  \
    && mv /PatchedJavaMakefile.am Java/Makefile.am \
	&& sh ./autogen.sh \
    && ./configure --disable-perl --disable-ruby --disable-mzscheme --disable-guile --disable-csharp --disable-ocaml --disable-r --disable-python --with-jdk-include=/usr/lib/jvm/java-8-openjdk-amd64/include --with-jdk-system-include=/usr/lib/jvm/java-8-openjdk-amd64/include/linux CXXFLAGS=-O3 \
    && make clean && make && make install \
    && cd ..

CMD bash


