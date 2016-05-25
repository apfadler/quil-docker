#!/bin/sh

cd $QUIL_HOME/quantlib-java
docker build -t quantlib-java-test .
docker tag -f quantlib-java-test apfadler/quantlib-java
docker push apfadler/quantlib-java
