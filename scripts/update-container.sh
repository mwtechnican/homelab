#!/bin/bash
docker-compose -f /homelab/docker-compose.yml -p home-lab pull
docker-compose -f /homelab/docker-compose.yml -p home-lab up -d
docker image prune -f
echo ""
echo ""