# load variables
. .env

# install docker and docker-compose
bash ./scripts/install_requirements.sh

# load checkmk image and import to docker
bash ./scripts/load_checkmk_image.sh $CHECKMK_EDITION $CHECKMK_VERSION

# create network
bash ./scripts/create_external_networks.sh

# secrets should not be empty
sudo docker-compose -f docker-compose.yml -p home-lab pull
sudo docker-compose -f docker-compose.yml -p home-lab up -d
