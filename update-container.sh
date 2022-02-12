#!/bin/bash
echo -e "\e[32mupdating containers used in stack 'home-lab' and 'home-nextcloud'\e[0m"
docker-compose -f docker-compose.yml -p home-lab pull
docker-compose -f docker-compose.yml -p home-lab up -d
docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud pull
docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud up -d
docker image prune -f
echo ""