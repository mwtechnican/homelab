#!/bin/bash
# this is used to create the docker network 
# create networks
sudo docker network create --driver=bridge --subnet=172.18.0.0/24 proxynet
sudo docker network create --driver=bridge --subnet=172.19.0.0/24 socketproxynet