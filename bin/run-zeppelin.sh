#!/bin/sh

docker run -d --net="host" -v $QUIL_HOME/notebooks:/zeppelin/notebook apfadler/quantlib-zeppelin