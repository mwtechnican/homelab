#!/bin/bash
FILENAME=$(ls data/checkmk/cmk/ | grep check-mk-agent)
docker exec --workdir /omd/sites/cmk checkmk dpkg --install $FILENAME