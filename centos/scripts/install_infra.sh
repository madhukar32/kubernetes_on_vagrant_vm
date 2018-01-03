#!/bin/bash -eux
#Add basic repo to sources.list

sudo bash -c 'cat <<EOF >/etc/apt/sources.list
###### Ubuntu Main Repos
deb http://01.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse
deb-src http://01.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse

###### Ubuntu Update Repos
deb http://01.archive.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse
deb http://01.archive.ubuntu.com/ubuntu/ xenial-updates main restricted universe multiverse
deb http://01.archive.ubuntu.com/ubuntu/ xenial-proposed main restricted universe multiverse
deb http://01.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://01.archive.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse
deb-src http://01.archive.ubuntu.com/ubuntu/ xenial-updates main restricted universe multiverse
deb-src http://01.archive.ubuntu.com/ubuntu/ xenial-proposed main restricted universe multiverse
deb-src http://01.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse
EOF'


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
wget https://releases.hashicorp.com/vagrant/1.9.8/vagrant_1.9.8_x86_64.deb -P ${TMP_DIR}
sudo dpkg -i ${TMP_DIR}/vagrant_1.9.8_x86_64.deb
