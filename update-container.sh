#!/bin/bash
echo -e "loading variables '.env'"
. .env

echo -e "loading checkmk image"
bash sripts/get_checkmk_image.sh $CHECKMK_EDITION $CHECKMK_VERSION

echo -e "updating containers used in stack 'home-lab'"
docker-compose -f docker-compose.yml -p home-lab pull
docker-compose -f docker-compose.yml -p home-lab up -d
if [ $install_nextcloud = 'true' ]; then
    echo -e "updating containers used in stack 'home-nextcloud'"
    docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud pull
    docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud up -d
fi
docker image prune -f
echo ""