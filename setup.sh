#!/bin/bash
echo -e "\e[32mloading variables '.env'\e[0m"
. .env

echo -e "\e[32minstall docker and docker-compose\e[0m"
bash ./scripts/install_requirements.sh

echo -e "\e[32mload checkmk image and import to docker\e[0m"
bash ./scripts/load_checkmk_image.sh $CHECKMK_EDITION $CHECKMK_VERSION

echo -e "\e[32mcreate docker network\e[0m"
bash ./scripts/create_external_networks.sh

echo -e "\e[32msecrets should not be empty, are they?\e[0m"
read -e -p "y/n" SECRETS_EMPTY

if [ $SECRETS_EMPTY -eq "n" ]
then
    sudo docker-compose -f docker-compose.yml -p home-lab pull
    sudo docker-compose -f docker-compose.yml -p home-lab up -d
else
   echo "please fix empty secret files"
fi
