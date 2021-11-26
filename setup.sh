# load variables
. .env

# install docker and docker-compose
install_requirements.sh

# create containerdata folder
sudo mkdir ./containerdata

# secrets should not be empty
sudo docker-compose -f docker-compose.yml -p home-lab pull
sudo docker-compose -f docker-compose.yml -p home-lab up -d
