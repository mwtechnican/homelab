#!/bin/bash
. .env
echo "starting containers used in stack 'home-lab'"
docker-compose -f docker-compose.yml -p home-lab up -d

echo "installing checkmk-mk-agent in container checkmk"
bash scripts/install_check-mk-agent.sh
echo ""