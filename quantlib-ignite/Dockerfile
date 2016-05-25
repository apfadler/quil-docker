FROM apfadler/quantlib-java
MAINTAINER Andreas Pfadler <andreas.pfadler@gmail.com>
LABEL Description="An environment with the QuantLib Java module and Apache Ignite QUIL Node"

RUN wget http://mirror.dkd.de/apache/ignite/1.4.0/apache-ignite-fabric-1.4.0-bin.zip \
    && unzip apache-ignite-fabric-1.4.0-bin.zip \
    && rm apache-ignite-fabric-1.4.0-bin.zip \
    && mv apache-ignite-fabric-1.4.0-bin /ignite \
    && cp /usr/local/lib/QuantLib.jar /ignite/libs \
    && cp /ignite/libs/optional/ignite-aws/*.jar /ignite/libs

COPY ignite-config.xml /ignite/config/default-config.xml
COPY libs/*.jar /ignite/libs/

RUN ln -s /tmp /ignite/tmp

CMD cd /ignite &&  IGNITE_HOME=/ignite DEFAULT_CONFIG=config/default-config.xml LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib bin/ignite.sh


