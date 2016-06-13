#!/bin/sh

docker run -d -e "QUIL_WORKER=true"  \
			  --net="host" apfadler/quantlib-quil-server