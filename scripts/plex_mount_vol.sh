#!/bin/bash
mount --source PARTUUID="c3f3f4c9-162b-46fc-9c33-0dcbecda78ef" --target ./data/plex/mnt/seagate-3tb # LABEL="Seagate 3TB"
mount --source PARTUUID="38575592-27fc-4475-b530-6fb12f554dc4" --target ./data/plex/mnt/seagate-8tb # LABEL="Seagate 8TB"
docker restart plex