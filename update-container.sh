#!/bin/bash
docker-compose -f /homelab/docker-compose.yml -p home-lab pull
docker-compose -f /homelab/docker-compose.yml -p home-lab up -d
docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud pull
docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud up -d
docker image prune -f
echo ""
echo ""