#!/bin/bash

nohup /opt/bin/docker-gen -watch -only-exposed --tlscacert=/certs/ca.pem --tlscert=/certs/cert.pem --tlskey=/certs/key.pem -endpoint=$ENDPOINT_SWARM_MASTER -notify "service nginx reload" /template/nginx.tmpl /etc/nginx/nginx.conf &

nginx

