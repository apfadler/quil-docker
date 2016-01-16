#!/bin/sh

docker run -d -e "QUIL_PORT=$QUIL_PORT"  \
			  -e "QUIL_SERVER_STANDALONE=true"  \
			  --net="host" apfadler/quantlib-quil-server