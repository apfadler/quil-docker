FROM apfadler/quantlib-java
MAINTAINER Andreas Pfadler <andreas.pfadler@gmail.com>
LABEL Description="An environment with the QuantLib Java module and Apache Zeppelin notebook"

RUN apt-get update && apt-get install -y maven

RUN git clone https://github.com/apfadler/incubator-zeppelin.git \
    && cd incubator-zeppelin \
	&& git checkout branch-0.5.5  \
	&& mvn clean package -DskipTests -Dignite.version=1.5.0.final -Pbuild-distr \
    && cp /incubator-zeppelin/zeppelin-distribution/target/zeppelin-0.5.5-incubating*gz / \
    && cd / && tar zxfv zeppelin*gz &&  mv zeppelin-0.5.5-incubating zeppelin && rm /zeppelin*gz \
    && mkdir -p /zeppelin/notebook && rm -rf /incubator-zeppelin
	
COPY libs/server-0.1-SNAPSHOT.jar /zeppelin/lib/server-0.1-SNAPSHOT.jar

COPY libs/json-simple-1.1.1.jar /zeppelin/lib/json-simple-1.1.1.jar

COPY libs/spray-json_2.10-1.3.2.jar /zeppelin/lib/spray-json_2.10-1.3.2.jar

COPY libs/quantlib-1.7.jar /zeppelin/lib/quantlib-1.7.jar

COPY interpreter.json /zeppelin/conf/interpreter.json

CMD cd /zeppelin && LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib:/usr/local/lib bin/zeppelin-daemon.sh start && top -b


