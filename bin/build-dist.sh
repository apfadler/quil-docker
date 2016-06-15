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

echo "Preparing docker images..."
cp -r dist ../../quantlib-quil-server
chmod a+x ../../quantlib-quil-server/dist/bin/*.sh
cp -r dist ../../quantlib-quil-worker
chmod a+x ../../quantlib-quil-worker/dist/bin/*.sh
cp -r dist ../../quantlib-quil-aws-worker
chmod a+x ../../quantlib-quil-aws-worker/dist/bin/*.sh

mkdir ../../quantlib-zeppelin/libs
cp -r dist/libs/* ../../quantlib-zeppelin/libs

cd ../../

echo "Done"
