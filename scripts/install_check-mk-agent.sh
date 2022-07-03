#!/bin/bash
FILENAME=$(ls data/checkmk/cmk/ | grep check-mk-agent)
docker exec --workdir /omd/sites/cmk checkmk dpkg --install $FILENAME > null

# Agent Updates
docker exec -it -u root checkmk cmk-update-agent register -s checkmk.wiedmann-tech.de -i cmk -H checkmk.wiedmann-tech.de -p https -U cmkadmin -P '9C[Z92=$C&%dZG8/M96m' -v > null
docker exec -it -u root checkmk cmk-update-agent -v > null