# quil-docker

This is a collection of scripts and Dockerfiles for for QUIL: a proof of concept for a distributed pricing architecture based on Apache Ignite and QuantLib.

For more info see http://quantlib.org/slides/qlum15/pfadler.pdf.

The source code for QUIL is found at https://github.com/apfadler/quil-src

# Quickstart

0.) Install Docker

1.) git clone https://github.com/apfadler/quil-docker.git

2.) cd quil-docker

3.) bin/run-run-quil-server-standalone.sh (This will start the QUIL server in standalone mode and webapp running on localhost:8081/frontend)

4.) bin/run-zeppelin.sh (This will start an Apache Zeppelin server on localhost:8080 with an Ignite interpreter that is connected to the QUIL cluster, it includes an Example notebook)

# Advanced usage

Checkout bin/create-cluster.sh if you would like to get an idea about how to run a QUIL cluster on AWS. It will try to create a new EC2 instance running a QUIL worker node. Once the node is up an running it will start the main QUIL server and a Zeppelin Server.
