#!/bin/bash
echo -e "\e[32mloading variables '.env'\e[0m"
. .env

echo -e "\e[32mnow enter the secrets which should be used for the containers\e[0m"
read -s -p "Enter bitwarden_admin_token: " bitwarden_admin_token
read -s -p "Enter ionos_api_key: " ionos_api_key
read -s -p "Enter nextcloud_admin_password: " nextcloud_admin_password
read -s -p "Enter nextcloud_admin_user: " nextcloud_admin_user
read -s -p "Enter nextcloud_postgres_db: " nextcloud_postgres_db
read -s -p "Enter nextcloud_postgres_password: " nextcloud_postgres_password
read -s -p "Enter nextcloud_postgres_user: " nextcloud_postgres_user
read -s -p "Enter smtp_host: " smtp_host
read -s -p "Enter smtp_password: " smtp_password
read -s -p "Enter smtp_user: " smtp_user

echo $bitwarden_admin_token >> ./secrets/bitwarden_admin_token
unset bitwarden_admin_token
read $ionos_api_key>> ./secrets/ionos_api_key
unset ionos_api_key
read $nextcloud_admin_password>> ./secrets/nextcloud_admin_password
unset nextcloud_admin_password
read $nextcloud_admin_user>> ./secrets/nextcloud_admin_user
unset nextcloud_admin_user
read $nextcloud_postgres_db>> ./secrets/nextcloud_postgres_db
unset nextcloud_postgres_db
read $nextcloud_postgres_password>> ./secrets/nextcloud_postgres_password
unset nextcloud_postgres_password
read $nextcloud_postgres_user>> ./secrets/nextcloud_postgres_user
unset nextcloud_postgres_user
read $smtp_host>> ./secrets/smtp_host
unset smtp_host
read $smtp_password>> ./secrets/smtp_password
unset smtp_password
read $smtp_user>> ./secrets/smtp_user
unset smtp_user

echo -e "\e[32minstall docker and docker-compose\e[0m"
bash ./scripts/install_requirements.sh

echo -e "\e[32mcreate docker network\e[0m"
bash ./scripts/create_external_networks.sh

echo -e "\e[32msecrets should not be empty\e[0m"
docker-compose -f docker-compose.yml -p home-lab pull
docker-compose -f docker-compose.yml -p home-lab up -d

docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud pull
docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud up -d