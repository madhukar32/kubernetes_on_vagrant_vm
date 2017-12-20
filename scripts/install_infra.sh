#!/bin/bash -eux
#Add basic repo to sources.list
cat <<EOF >/etc/apt/sources.list
deb http://01.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse
deb-src http://01.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse
EOF
sudo apt-get update -y
sleep 2

#Install dependency packages
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    vim-common=2:7.4.1689-3ubuntu1 \
    vim \
    build-essentials \
    dkms \
    software-properties-common -y --allow-downgrades

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
echo 'deb http://download.virtualbox.org/virtualbox/debian xenial contrib' >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get install virtualbox-5.1

export TMP_DIR=$(mktemp -d)
wget https://releases.hashicorp.com/vagrant/1.9.8/vagrant_1.9.8_x86_64.deb -P ${TMP_DIR}
dpkg -i ${TMP_DIR}/vagrant_1.9.8_x86_64.deb
