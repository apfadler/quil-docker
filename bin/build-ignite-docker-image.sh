#!/bin/sh

cd $QUIL_HOME/quantlib-ignite
docker build -t quantlib-ignite-test .
docker tag -f quantlib-ignite-test apfadler/quantlib-ignite
docker push apfadler/quantlib-ignite
