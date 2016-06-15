#!/bin/sh

cd $QUIL_HOME/quantlib-quil-worker
docker build -t quantlib-quil-worker-test .
docker tag -f quantlib-quil-worker-test  apfadler/quantlib-quil-worker
docker push apfadler/quantlib-quil-worker
