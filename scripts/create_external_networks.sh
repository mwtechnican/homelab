#!/bin/bash
# this is used to create the docker network 
# create networks
docker network create --driver=bridge --subnet=172.18.0.0/24 dockernet
echo ""