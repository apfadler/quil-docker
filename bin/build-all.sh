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
cd server
mvn clean install
cp target/*.jar ../../../quantlib-quil-server
cp -r target/libs ../../../quantlib-quil-server 
cp -r ../bin/* ../../../bin
cp -r ../sampledata ../../../sampledata

echo "Building docker images..."
cd ../../../bin


./build-ignite-docker-image.sh
./build-zeppelin-docker-image.sh
./build-quil-server-docker-image.sh

echo "Done"
