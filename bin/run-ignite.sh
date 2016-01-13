#!/bin/sh

docker run -d  -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID"  \
			  -e "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" \
			  -e "AWS_S3_BUCKET=$AWS_S3_BUCKET" \
			  --net="host" apfadler/quantlib-ignite 
