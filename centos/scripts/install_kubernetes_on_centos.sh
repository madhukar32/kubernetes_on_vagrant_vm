#!/bin/bash -eux

sudo yum update -y

#Add basic repo to sources.list
sudo bash -c 'cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
sslverify=0
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF'

sudo yum update -y

sudo yum install -y \
        ca-certificates \
        software-properties-common \
        curl \
        nfs-common \
        git \
        make \
        ceph-common \
	docker.io


#Install kubernetes
sleep 2
yum install docker kubeadm-1.7.4-0 kubectl-1.7.4-0 kubelet-1.7.4-0 -y
