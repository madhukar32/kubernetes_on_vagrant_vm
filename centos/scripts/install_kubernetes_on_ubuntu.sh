#!/bin/bash -eux

sudo apt-get update -y

#Add basic repo to sources.list
sudo bash -c 'cat <<EOF >/etc/apt/sources.list
deb http://01.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse
deb-src http://01.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse
EOF'

sudo apt-get update -y

sudo apt-get install --no-install-recommends -qq \
        apt-transport-https \
        ca-certificates \
        software-properties-common \
        curl \
        nfs-common \
        git \
        make \
        ceph-common \
	docker.io


#Install kubernetes
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update -y
sleep 2
sudo apt-get install -y kubectl=1.7.0-00
sudo apt-get install -y kubelet=1.7.0-00
sudo apt-get install -y kubeadm=1.7.0-00
