
#! /bin/bash

#instal common utilities

echo " ======= Instal Docker ============"

#install docker

 sudo apt-get update
 sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

echo " ======= Instal Jenkins ============"

sudo docker pull jenkins/jenkins:2.303.1

mkdir -p /opt/jenkins_home

sudo docker run -p 80:8080 -p 50000:50000 -d -u root -v /opt/jenkins_home:/var/jenkins_home jenkins/jenkins:2.303.1

#install Kubectl
echo " ======= Instal kubectl ============"

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#install Docker-compose
  #install docker-compose. This is latest version need to update script to install specific required version
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
