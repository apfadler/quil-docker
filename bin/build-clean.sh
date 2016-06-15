#!/bin/sh

source bin/env.sh

echo "Using QUIL_HOME = $QUIL_HOME"

echo "Cleaning up..."
cp  build/quil-src/dist/bin/*.sh bin/
cp -r build/quil-src/dist/sampledata ./
cp -r build/quil-src/dist/libs ./
cp -r build/quil-src/dist/config ./
cp  build/quil-src/dist/*.xml ./

rm -rf build
rm -rf quantlib-quil-worker/libs
rm -rf quantlib-quil-aws-worker/libs
rm -rf quantlib-quil-server/dist

echo "Done"
