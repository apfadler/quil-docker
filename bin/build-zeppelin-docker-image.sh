#!/bin/sh

cd $QUIL_HOME/quantlib-zeppelin
docker build -t zeppelin-test .
docker tag -f zeppelin-test apfadler/quantlib-zeppelin
docker push apfadler/quantlib-zeppelin
