#!/bin/bash
. .env

echo -e "stopping containers used in stack 'home-lab'"
docker-compose -f docker-compose.yml -p home-lab down
echo ""