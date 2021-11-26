sudo docker-compose -f /containerdata/docker-compose.yaml up -d

sudo docker-compose -f /containerdata/docker-compose.yaml down
rm /containerdata -rf

sudo docker rm traefik pihole bitwarden portainer checkmk -f