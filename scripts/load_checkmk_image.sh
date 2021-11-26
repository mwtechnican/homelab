#!/bin/bash
# download CheckMK Enterprise
# Download: https://checkmk.com/download?edition=cfe&version=stable&dist=docker
# Guide: https://docs.checkmk.com/latest/en/introduction_docker.html
# simply change filename to the version needed

CHECKMK_EDITION=$1
CHECKMK_VERSION=$2

FILENAME=$CHECKMK_EDITION-$CHECKMK_VERSION.tar.gz

sudo mkdir ./images
sudo wget https://download.checkmk.com/checkmk/2.0.0p15/$FILENAME -O ./images/$FILENAME
sudo docker load -i ./images/$FILENAME