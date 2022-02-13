#!/bin/bash
# CheckMK Enterprise
# Download      : https://checkmk.com/download?edition=cfe&version=stable&dist=docker
# Guide         : https://docs.checkmk.com/latest/en/introduction_docker.html
# example link  : https://download.checkmk.com/checkmk/2.0.0p19/check-mk-free-docker-2.0.0p19.tar.gz
##################################################################

checkmk_edition=$1
checkmk_version=$2

mkdir -p ./images

if test -z "$(docker images -q checkmk/$(echo "${checkmk_edition%-docker}"):${checkmk_version})"; then
    echo "downloading checkmk image - ${checkmk_edition}-${checkmk_version}"
    wget https://download.checkmk.com/checkmk/${checkmk_version}/${checkmk_edition}-${checkmk_version}.tar.gz -O ./images/${checkmk_edition}-${checkmk_version}.tar.gz
    docker load -i ./images/${checkmk_edition}-${checkmk_version}.tar.gz
fi