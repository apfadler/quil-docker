#!/bin/sh

source bin/env.sh

echo "Using QUIL_HOME = $QUIL_HOME"

echo "Retrieving quil-src..."
rm -rf build
mkdir build
cd build
git clone https://github.com/apfadler/quil-src.git
cd quil-src
git checkout master

echo "Building quil-server..."
mvn clean install
cp -r dist ../../quantlib-quil-server
chmod a+x ../../quantlib-quil-server/dist/bin/*.sh

mkdir ../../quantlib-ignite/libs
cp -r dist/libs/* ../../quantlib-ignite/libs

echo "Building docker images..."
cd ../../bin

./build-ignite-docker-image.sh
./build-zeppelin-docker-image.sh
./build-quil-server-docker-image.sh

echo "Done"
