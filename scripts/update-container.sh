#!/bin/bash
sudo docker-compose -f /containerdata/docker-compose.yaml -p home-lab pull
sudo docker-compose -f /containerdata/docker-compose.yaml -p home-lab up -d
sudo docker image prune -f
