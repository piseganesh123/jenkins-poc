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

#install Java & maven
apt-get install -y openjdk-11-jre-headless maven
  
#Install Ansible
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

touch /etc/ansible/hosts
chmod o+rw /etc/ansible/hosts

#download jenkins agent liabrary
wget http://34.93.89.27/jnlpJars/agent.jar

mv ./agent.jar /home/piseg432/ && chown piseg432 /home/piseg432/agent.jar