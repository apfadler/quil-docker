#!/bin/sh

cd $QUIL_HOME/quantlib-threadsafe
docker build -t quantlib-test .
docker tag -f quantlib-test apfadler/quantlib-threadsafe
docker push apfadler/quantlib-threadsafe
