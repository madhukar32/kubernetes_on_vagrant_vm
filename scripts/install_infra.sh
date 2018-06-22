#!/bin/bash -eux
#Add basic repo to sources.list

VAGRANT_VERSION=${VAGRANT_VERSION:-'2.1.0'}

sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes update
sleep 2

#Install dependency packages
sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install \
    apt-transport-https \
    ca-certificates \
    curl \
    vim \
    build-essential \
    dkms \
    software-properties-common

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
echo 'deb http://download.virtualbox.org/virtualbox/debian xenial contrib' | \
	sudo tee -a /etc/apt/sources.list > /dev/null

sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes update
sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install virtualbox-5.1
sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes install dkms

export TMP_DIR=$(mktemp -d)
wget https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.deb -P ${TMP_DIR}
sudo dpkg -i ${TMP_DIR}/vagrant_${VAGRANT_VERSION}_x86_64.deb
