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

echo "Building docker images..."
cp -r dist ../../quantlib-quil-server
chmod a+x ../../quantlib-quil-server/dist/bin/*.sh
cp -r dist ../../quantlib-quil-worker
chmod a+x ../../quantlib-quil-worker/dist/bin/*.sh
cp -r dist ../../quantlib-quil-aws-worker
chmod a+x ../../quantlib-quil-aws-worker/dist/bin/*.sh


mkdir ../../quantlib-zeppelin/libs
cp -r dist/libs/* ../../quantlib-zeppelin/libs
cp dist/config/*.xml ../../quantlib-zeppelin/


cd ../../bin
./build-quantlib-docker-image.sh
./build-quantlib-java-docker-image.sh
./build-quil-worker-docker-image.sh
./build-quil-aws-worker-docker-image.sh
./build-quil-server-docker-image.sh
./build-zeppelin-docker-image.sh

echo "Cleaning up..."
cd ..
cp  build/quil-src/dist/bin/*.sh bin/
cp -r build/quil-src/dist/sampledata ./
cp -r build/quil-src/dist/libs ./
cp -r build/quil-src/dist/config ./
cp  build/quil-src/dist/*.xml ./

rm -rf build
rm -rf quantlib-quil-worker/libs
rm -rf quantlib-quil-aws-worker/libs
rm -rf quantlib-quil-server/dist
rm -rf quantlib-zeppelin/libs

echo "Done"
