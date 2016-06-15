#!/bin/sh

source bin/env.sh

echo "Using QUIL_HOME = $QUIL_HOME"

echo "Building docker images..."

cd  bin
./build-quantlib-docker-image.sh
./build-quantlib-java-docker-image.sh
./build-quil-worker-docker-image.sh
./build-quil-aws-worker-docker-image.sh
./build-quil-server-docker-image.sh
./build-zeppelin-docker-image.sh


echo "Done"
