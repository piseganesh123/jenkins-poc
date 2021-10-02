# jenkins-poc
Poc for Jenkins installation and configuratio

to generate ssh key inside jenkins container to use with publish over ssh plugin

ssh-keygen -t rsa -m PEM -f /root/sshrsakey/.ssh/id_rsa

install agent on Node using 
$wget http://35.200.213.6/jnlpJars/agent.jar

install jdk on agent
