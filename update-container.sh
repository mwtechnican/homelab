#!/bin/bash
. .env
echo "loading checkmk image"
bash scripts/get_checkmk_image.sh $checkmk_edition $checkmk_version

echo "updating containers used in stack 'home-lab'"
docker compose -f docker-compose.yml -p home-lab pull --ignore-pull-failures

echo "checkmk agent musted be updated in the checkmk container"
echo ""