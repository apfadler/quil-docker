#!/bin/sh

docker-machine -D create \
    --driver amazonec2 \
    --amazonec2-access-key $AWS_ACCESS_KEY_ID \
    --amazonec2-secret-key $AWS_SECRET_ACCESS_KEY \
    --amazonec2-vpc-id $AWS_VPC_ID \
    --amazonec2-region eu-central-1 \
    --amazonec2-zone b \
    $1 


aws ec2 authorize-security-group-ingress  \
	--group-name docker-machine \
	--protocol tcp --port 47500-47509 \
	--cidr $(curl checkip.amazonaws.com)/32
