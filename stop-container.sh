#!/bin/bash
echo -e "\e[32mstopping containers used in stack 'home-lab' and 'home-nextcloud'\e[0m"
docker-compose -f docker-compose.yml -p home-lab down
docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud down
echo ""