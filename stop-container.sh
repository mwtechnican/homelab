#!/bin/bash
blue=`tput setaf 4` # use color
reset=`tput sgr0` # reset color

echo -e "${blue}loading variables '.env'${reset}"
. .env

echo -e "${blue}stopping containers used in stack 'home-lab'${reset}"
docker-compose -f docker-compose.yml -p home-lab down
if [ $install_nextcloud = 'true' ]; then
    echo -e "${blue}stopping containers used in stack 'home-nextcloud'${reset}"
    docker-compose -f docker-compose.yml -p home-lab down
fi
echo ""