# Quelle: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04#:~:text=How%20To%20Install%20and%20Use%20Docker%20on%20Ubuntu,Working%20with%20Docker%20Images.%20...%20More%20items...%20
# This is used to install the requirements on debian 11
# - docker
# - docker-compose

sudo apt-get update
sudo apt-get upgrade -y

# install docker 
sudo apt-get install ca-certificates curl gnupg lsb-release -y
sudo curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose