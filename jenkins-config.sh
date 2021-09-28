
#! /bin/bash


echo " ======= Instal kubectl ============"

#instal common utilities
#install Kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -

echo " ======= Instal Docker ============"

#curl -LO https://github.com/prometheus/prometheus/releases/download/v2.0.0/prometheus-2.0.0.linux-amd64.tar.gz

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

sudo docker run -p 80:8080 -p 50000:50000 -d -u root -v /home/piseg432/jenkins-home:/var/jenkins_home jenkins/jenkins:2.303.1

