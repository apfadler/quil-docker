#!/bin/sh

$QUIL_HOME/bin/create-quil-worker-node.sh ignite-test-1

eval "$(docker-machine env ignite-test-1)"
$QUIL_HOME/bin/run-quil-worker.sh


eval "$(docker-machine env -u)"
$QUIL_HOME/bin/run-quil-worker.sh
$QUIL_HOME/bin/run-zeppelin.sh
$QUIL_HOME/bin/run-quil-server.sh