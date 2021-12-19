#!/bin/bash
docker-compose -f /homelab/docker-compose.yaml -p home-lab pull
docker-compose -f /homelab/docker-compose.yaml -p home-lab up -d
docker image prune -f
echo ""
echo ""