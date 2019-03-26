#!/usr/bin/env bash

UBUNTU_RELEASE=$(lsb_release -cs)
VIRTUALBOX_VERSION=6.0.0

apt-get update

#
# Docker
#
apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
software-properties-common
# GPG key for the official Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# add Docker repository to APT
add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

apt-get install -y docker-ce

# check Docker daemon
systemctl status docker

# add current ${USER} to the docker group
usermod -aG docker ${USER}
su - ${USER}
id -nG

#
# VirtualBox
#
apt-get install -y virtualbox \
virtualbox-ext-pack \
virtualbox-guest-additions-iso

#
# VirtualBox Oracle
#
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -
add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian ${UBUNTU_RELEASE} contrib"

apt-get update && \
apt-get install virtualbox-6.0

# Installing VirtualBox Extension Pack
wget https://download.virtualbox.org/virtualbox/6.0.0/Oracle_VM_VirtualBox_Extension_Pack-6.0.0.vbox-extpack
VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.0.0.vbox-extpack

#
# Vagrant
#
apt-get install -y vagrant

#
# Git
#
apt-get install -y git

#
# Python
#
# python v2
apt-get install -y python
# python v3
apt-get install -y python3
# python latest (3.8)
apt-get update &&   apt-get install -y software-properties-common
add-apt-repository -y ppa:deadsnakes/ppa
apt-get install -y python3.8

#
# Java [11] Oracle
#
add-apt-repository -y ppa:linuxuprising/java
apt-get update
echo oracle-java11-installer shared/accepted-oracle-license-v1-2 select true | /usr/bin/debconf-set-selections && \
apt-get install -y oracle-java11-installer && \
apt-get install oracle-java11-set-default

JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/bin/"
source /etc/environment
echo ${JAVA_HOME}

#
# nvm [v0.34.0]
#
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
nvm install 11
nvm install-latest-npm

# cleanup
apt-get autoremove -y &&  apt-get autoclean -y
