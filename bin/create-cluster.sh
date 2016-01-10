#!/bin/sh

$QUIL_HOME/bin/create-quantlib-ignite-node.sh ignite-test-1

eval "$(docker-machine env ignite-test-1)"
$QUIL_HOME/bin/run-ignite.sh


eval "$(docker-machine env -u)"
$QUIL_HOME/bin/run-ignite.sh
$QUIL_HOME/bin/run-zeppelin.sh