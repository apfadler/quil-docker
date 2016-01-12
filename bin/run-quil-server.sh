#!/bin/sh

docker run -d -e "QUIL_PORT=$QUIL_PORT"  \
			  --net="host" apfadler/quantlib-quil-server