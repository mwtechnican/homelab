#!/bin/bash
read -r -p "variables specified in .env file [true]?: " ENVFILESPECIFIED
ENVFILESPECIFIED=${ENVFILESPECIFIED:-true}
if [ $ENVFILESPECIFIED = 'true' ]; then
    echo -e "loading variables '.env'"
    . .env

    echo -e "secrets in folder secrets defined and secured [true]?: " SECRETSDEFINED
    SECRETSDEFINED=${SECRETSDEFINED:-true}
    if [ $SECRETSDEFINED = 'true' ]; then
        echo "install docker and docker-compose"
        bash ./scripts/install_requirements.sh

        echo "create docker network"
        bash ./scripts/create_external_networks.sh

        echo "downloading container images"
        docker-compose -f docker-compose.yml -p home-lab pull

        echo "creating container"
        docker-compose -f docker-compose.yml -p home-lab up -d

        if [ $install_nextcloud = 'true' ]; then
            echo "[nextcloud] downloading container images"
            docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud pull

            echo "[nextcloud] creating container"
            docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud up -d
        fi
    fi
fi