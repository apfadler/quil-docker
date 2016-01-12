FROM lballabio/quantlib
MAINTAINER Andreas Pfadler <andreas.pfadler@gmail.com>
LABEL Description="An environment with the QuantLib Java module and the Quil Server"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-7-jdk automake swig maven \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ARG quantlib_swig_version=1.7
ENV quantlib_swig_version ${quantlib_swig_version}

COPY PatchedJavaMakefile.am /PatchedJavaMakefile.am

RUN wget http://downloads.sourceforge.net/project/quantlib/QuantLib/${quantlib_swig_version}/other\ languages/QuantLib-SWIG-${quantlib_swig_version}.tar.gz \
    && tar xfz QuantLib-SWIG-${quantlib_swig_version}.tar.gz \
    && rm QuantLib-SWIG-${quantlib_swig_version}.tar.gz \
    && cd QuantLib-SWIG-${quantlib_swig_version} \
    && mv /PatchedJavaMakefile.am Java/Makefile.am \
    && ./configure --disable-perl --disable-ruby --disable-mzscheme --disable-guile --disable-csharp --disable-ocaml --disable-r --disable-python --with-jdk-include=/usr/lib/jvm/java-7-openjdk-amd64/include --with-jdk-system-include=/usr/lib/jvm/java-7-openjdk-amd64/include/linux CXXFLAGS=-O3 \
    && make clean && make && make install \
    && cd ..

RUN  mkdir -p /quil/libs  

COPY server-0.1-SNAPSHOT.jar /quil
COPY libs/*.jar /quil/libs/

RUN cp /usr/local/lib/QuantLib.jar /quil/libs

CMD cd /quil && LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib java -cp ".:libs/" org.quil.QuilServer


