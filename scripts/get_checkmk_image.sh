#!/bin/bash
# CheckMK Enterprise

# Download: https://checkmk.com/download?edition=cfe&version=stable&dist=docker
# Guide: https://docs.checkmk.com/latest/en/introduction_docker.html
##################################################################

CHECKMK_EDITION = $1
CHECKMK_VERSION = $2

echo -e "loading variables '/containerdata/.env'"
. /containerdata/.env

echo "downloading checkmk image - ${CHECKMK_EDITION}-${CHECKMK_VERSION}"
sudo wget https://download.checkmk.com/checkmk/${CHECKMK_VERSION}/${CHECKMK_EDITION}-${CHECKMK_VERSION}.tar.gz -O /containerdata/images/${CHECKMK_EDITION}-${CHECKMK_VERSION}.tar.gz
sudo docker load -i /containerdata/images/${CHECKMK_EDITION}-${CHECKMK_VERSION}.tar.gz