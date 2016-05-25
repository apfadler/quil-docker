FROM apfadler/quantlib-java
MAINTAINER Andreas Pfadler <andreas.pfadler@gmail.com>
LABEL Description="An environment with the QuantLib Java module and Apache Zeppelin notebook"

RUN wget http://mirror.synyx.de/apache/incubator/zeppelin/0.5.5-incubating/zeppelin-0.5.5-incubating-bin-all.tgz \
    && tar zxfv zeppelin-0.5.5-incubating-bin-all.tgz \
    && rm zeppelin-0.5.5-incubating-bin-all.tgz \
    && mv zeppelin-0.5.5-incubating-bin-all /zeppelin \
    && mkdir -p /zeppelin/notebook
	
COPY libs/server-0.1-SNAPSHOT.jar /zeppelin/lib/server-0.1-SNAPSHOT.jar

COPY libs/json-simple-1.1.1.jar /zeppelin/lib/json-simple-1.1.1.jar

COPY libs/spray-json_2.10-1.3.2.jar /zeppelin/lib/spray-json_2.10-1.3.2.jar

COPY interpreter.json /zeppelin/conf/interpreter.json

CMD cd /zeppelin && CLASSPATH=/usr/local/lib/QuantLib.jar LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib bin/zeppelin-daemon.sh start && top -b

