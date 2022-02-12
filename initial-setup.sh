#!/bin/bash
echo -e "\e[32mloading variables '.env'\e[0m"
. .env

echo -e "\e[32mnow enter the secrets which should be used for the containers\e[0m"

read -s -r -p "Enter bitwarden_admin_token: " bitwarden_admin_token
echo
echo $bitwarden_admin_token >> ./secrets/bitwarden_admin_token
unset bitwarden_admin_token

read -s -r -p "Enter ionos_api_key: " ionos_api_key
echo
echo $ionos_api_key >> ./secrets/ionos_api_key
unset ionos_api_key

read -r -p "Enter nextcloud_admin_user [admin]: " nextcloud_admin_user
nextcloud_admin_user=${nextcloud_admin_user:-admin}
echo $nextcloud_admin_user >> ./secrets/nextcloud_admin_user
unset nextcloud_admin_user

read -s -r -p "Enter nextcloud_admin_password: " nextcloud_admin_password
echo
echo $nextcloud_admin_password >> ./secrets/nextcloud_admin_password
unset nextcloud_admin_password

read -r -p "Enter nextcloud_postgres_db [nextcloud-db]: " nextcloud_postgres_db
nextcloud_postgres_db=${nextcloud_postgres_db:-'nextcloud-db'}
echo $nextcloud_postgres_db >> ./secrets/nextcloud_postgres_db
unset nextcloud_postgres_db

read -r -p "Enter nextcloud_postgres_user [nextcloud]: " nextcloud_postgres_user
nextcloud_postgres_user=${nextcloud_postgres_user:-'nextcloud'}
echo $nextcloud_postgres_user >> ./secrets/nextcloud_postgres_user
unset nextcloud_postgres_user

read -s -r -p "Enter nextcloud_postgres_password: " nextcloud_postgres_password
echo
echo $nextcloud_postgres_password >> ./secrets/nextcloud_postgres_password
unset nextcloud_postgres_password

read -r -p "Enter smtp_host [smtp.ionos.de]: " smtp_host
smtp_host=${smtp_host:-smtp.ionos.de}
echo $smtp_host >> ./secrets/smtp_host
unset smtp_host

read -r -p "Enter smtp_user: " smtp_user
echo $smtp_user >> ./secrets/smtp_user
unset smtp_user

read -s -r -p "Enter smtp_password: " smtp_password
echo
echo $smtp_password >> ./secrets/smtp_password
unset smtp_password

echo ""
echo ""

####################################################################################

echo -e "\e[32minstall docker and docker-compose\e[0m"
bash ./scripts/install_requirements.sh

echo -e "\e[32mcreate docker network\e[0m"
bash ./scripts/create_external_networks.sh

echo -e "\e[32msecrets should not be empty\e[0m"
docker-compose -f docker-compose.yml -p home-lab pull
docker-compose -f docker-compose.yml -p home-lab up -d

docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud pull
docker-compose -f docker-compose-nextcloud.yml -p home-nextcloud up -d