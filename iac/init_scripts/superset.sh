#!/bin/bash

# First we install Docker
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add --
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian buster stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -a -G docker $USER

# Then we install Docker Compose
sudo apt-get install -y wget git
sudo wget https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m) -O /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Lastly we install and start Superset
sudo git clone https://github.com/apache/superset.git
cd superset
touch ./docker/requirements-local.txt
echo "pybigquery" >> ./docker/requirements-local.txt
sudo docker-compose -f docker-compose-non-dev.yml up