#!/bin/bash
blue=`tput setaf 4` # use color
reset=`tput sgr0` # reset color
echo -n -e ${blue}
read -r -p "variables specified in .env file [true]?: " ENVFILESPECIFIED
ENVFILESPECIFIED=${ENVFILESPECIFIED:-true}
echo -n -e ${reset}
if [ $ENVFILESPECIFIED = 'true' ]; then
    echo -e "${blue}loading variables '.env'${reset}"
    . .env

    echo -n -e ${blue}
    read -r -p "secrets in folder secrets defined and secured [true]?: " SECRETSDEFINED
    SECRETSDEFINED=${SECRETSDEFINED:-true}
    echo -n -e ${reset}
    
    if [ $SECRETSDEFINED = 'true' ]; then
        echo "${blue}install docker and docker-compose${reset}"
        bash ./scripts/install_requirements.sh

        echo "${blue}create docker network${reset}"
        bash ./scripts/create_external_networks.sh

        echo "${blue}downloading container images${reset}"
        bash scripts/get_checkmk_image.sh $checkmk_edition $checkmk_version
        docker-compose -f docker-compose.yml -p home-lab pull --ignore-pull-failures

        echo "${blue}creating container${reset}"
        docker-compose -f docker-compose.yml -p home-lab up -d

        if [ $install_nextcloud = 'true' ]; then
            echo "${blue}[nextcloud] downloading container images${reset}"
            docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud pull --ignore-pull-failures

            echo "${blue}[nextcloud] creating container${reset}"
            docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud up -d
        fi
    fi
fi