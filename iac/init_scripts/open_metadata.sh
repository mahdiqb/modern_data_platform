#!/bin/bash

# Setup follows the steps provided by OpenMetadata
# Documentation link: https://docs.open-metadata.org/install/run-openmetadata

# First we install Docker
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add --
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian buster stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -a -G docker $USER

# Then we install Docker Compose
sudo apt-get -y install wget
sudo wget https://github.com/docker/compose/releases/download/v2.2.2/docker-compose-$(uname -s)-$(uname -m) -O /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# We install pip
sudo apt install -y python3-pip

# We install and start OpenMetadata
mkdir openmetadata-docker && cd openmetadata-docker
pip3 install --upgrade pip setuptools
pip3 install --upgrade 'openmetadata-ingestion[docker]'
python3 -m metadata docker --start
