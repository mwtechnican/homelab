#!/bin/bash
blue=`tput setaf 4` # use color
reset=`tput sgr0` # reset color

echo -e "${blue}loading variables '.env'${reset}"
. .env

echo -e "${blue}loading checkmk image${reset}"
bash scripts/get_checkmk_image.sh $checkmk_edition $checkmk_version

echo -e "${blue}updating containers used in stack 'home-lab'${reset}"
docker-compose -f docker-compose.yml -p home-lab pull --ignore-pull-failures
docker-compose -f docker-compose.yml -p home-lab up -d
if [ $install_nextcloud = 'true' ]; then
    echo -e "${blue}updating containers used in stack 'home-nextcloud'${reset}"
    docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud pull --ignore-pull-failures
    docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud up -d
fi
docker image prune -f
echo ""