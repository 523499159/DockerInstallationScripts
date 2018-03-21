#Docker-CE Installation for Ubuntu Trusty 14.04

#SET UP THE REPOSITORY

#Older versions of Docker were called docker or docker-engine. If these are installed, uninstall them:

sudo apt-get remove docker docker-engine docker.io

#Update the apt package index and Unless you have a strong reason not to, install the linux-image-#extra-* packages, which allow Docker to use the aufs storage drivers.

sudo apt-get update

sudo apt-get install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual

#Update the apt package index:

sudo apt-get update

#Install packages to allow apt to use a repository over HTTPS:

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

#Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


#INSTALL DOCKER CE

#Update the apt package index.

sudo apt-get update

#Install the latest version of Docker CE, or go to the next step to install a specific version. #Any existing installation of Docker is replaced.

sudo apt-get install docker-ce



#The docker daemon binds to a Unix socket instead of a TCP port. By default that Unix socket is #owned by the user root and other users can only access it using sudo. The docker daemon always #runs as the root user.

#Create the docker group.

sudo groupadd docker

#Add your user to the docker group.

sudo usermod -aG docker $USER
