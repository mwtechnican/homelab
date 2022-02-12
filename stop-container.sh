#!/bin/bash
echo -e "loading variables '.env'"
. .env

echo -e "stopping containers used in stack 'home-lab'"
docker-compose -f docker-compose.yml -p home-lab down
docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud down
if [ $install_nextcloud = 'true' ]; then
    echo -e "stopping containers used in stack 'home-nextcloud'"
    docker-compose -f docker-compose.yml -p home-lab down
    docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud down
fi
echo ""