FROM apfadler/quantlib-java
MAINTAINER Andreas Pfadler <andreas.pfadler@gmail.com>
LABEL Description="An environment with the QuantLib Java module and Apache Ignite QUIL Node"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y unzip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN wget https://archive.apache.org/dist/ignite/1.5.0.final/apache-ignite-fabric-1.5.0.final-bin.zip \
    && unzip apache-ignite-fabric-1.5.0.final-bin.zip \
    && rm apache-ignite-fabric-1.5.0.final-bin.zip \
    && mv apache-ignite-fabric-1.5.0.final-bin /ignite \
    && cp /usr/local/lib/QuantLib.jar /ignite/libs \
    && cp /ignite/libs/optional/ignite-aws/*.jar /ignite/libs

COPY ignite-config.xml /ignite/config/default-config.xml
COPY libs/*.jar /ignite/libs/

RUN ln -s /tmp /ignite/tmp

CMD cd /ignite &&  IGNITE_HOME=/ignite DEFAULT_CONFIG=config/default-config.xml LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib bin/ignite.sh


