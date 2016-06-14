#!/bin/sh

cd $QUIL_HOME/quantlib-quil-aws-worker
docker build -t quantlib-quil-aws-worker-test .
docker tag -f quantlib-quil-aws-worker-test  apfadler/quantlib-quil-aws-worker
docker push apfadler/quantlib-quil-aws-worker
