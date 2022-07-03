#!/bin/bash
. .env

echo "updating containers used in stack 'home-lab'"
docker compose -f docker-compose.yml -p home-lab pull