FROM apfadler/quantlib-java
MAINTAINER Andreas Pfadler <andreas.pfadler@gmail.com>
LABEL Description="An environment with the QuantLib Java module and the Quil Server"

RUN  mkdir -p /quil/libs && mkdir -p /quil/bin && mkdir -p /quil/config && mkdir -p /quil/sampledata

COPY dist/libs /quil/libs/
COPY dist/bin /quil/bin/
COPY dist/config /quil/config/
COPY dist/sampledata /quil/sampledata/

RUN ln -s /tmp /quil/tmp

CMD cd /quil && JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib bin/quil-server.sh


