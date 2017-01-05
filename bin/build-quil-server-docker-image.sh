#!/bin/sh

cd $QUIL_HOME/quantlib-quil-server
docker build --no-cache -t quantlib-quil-server-test .
docker tag -f quantlib-quil-server-test apfadler/quantlib-quil-server
docker push apfadler/quantlib-quil-server
