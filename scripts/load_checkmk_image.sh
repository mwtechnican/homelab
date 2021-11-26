# download CheckMK Enterprise
# Download: https://checkmk.com/download?edition=cfe&version=stable&dist=docker
# Guide: https://docs.checkmk.com/latest/en/introduction_docker.html
# simply change filename to the version needed
CHECKMKVERSION=2.0.0p15
CHECKMKFILENAME=check-mk-free-docker-$CHECKMKVERSION.tar.gz

sudo mkdir ./images
sudo wget https://download.checkmk.com/checkmk/2.0.0p15/$CHECKMKFILENAME -O ./images/$CHECKMKFILENAME
sudo docker load -i ./images/$CHECKMKFILENAME