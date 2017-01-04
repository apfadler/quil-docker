#!/bin/sh

cd $QUIL_HOME/quantlib-zeppelin
docker build --no-cache -t zeppelin-test .
docker tag -f zeppelin-test apfadler/quantlib-zeppelin
docker push apfadler/quantlib-zeppelin
