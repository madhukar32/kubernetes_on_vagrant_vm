#!/bin/bash -eux

sudo docker load -i /vagrant/docker_file/contrail-analytics-ubuntu16.04-4.0.2.0-35.tar.gz
sudo docker load -i /vagrant/docker_file/contrail-controller-ubuntu16.04-4.0.2.0-35.tar.gz
sudo docker load -i /vagrant/docker_file/contrail-kube-manager-ubuntu16.04-4.0.2.0-35.tar.gz
sudo docker load -i /vagrant/docker_file/contrail-kubernetes-agent-ubuntu16.04-4.0.2.0-35.tar.gz
sudo docker load -i /vagrant/docker_file/contrail-analyticsdb-ubuntu16.04-4.0.2.0-35.tar.gz
sudo docker load -i /vagrant/docker_file/contrail-agent-ubuntu16.04-4.0.2.0-35.tar.gz

sudo docker tag contrail-analytics-ubuntu16.04:4.0.2.0-35 localhost:5000/contrail-analytics-ubuntu16.04:4.0.2.0-35
sudo docker tag contrail-controller-ubuntu16.04:4.0.2.0-35 localhost:5000/contrail-controller-ubuntu16.04:4.0.2.0-35
sudo docker tag contrail-kube-manager-ubuntu16.04:4.0.2.0-35 localhost:5000/contrail-kube-manager-ubuntu16.04:4.0.2.0-35
sudo docker tag contrail-kubernetes-agent-ubuntu16.04:4.0.2.0-35 localhost:5000/contrail-kubernetes-agent-ubuntu16.04:4.0.2.0-35
sudo docker tag contrail-analyticsdb-ubuntu16.04:4.0.2.0-35 localhost:5000/contrail-analyticsdb-ubuntu16.04:4.0.2.0-35
sudo docker tag contrail-agent-ubuntu16.04:4.0.2.0-35 localhost:5000/contrail-agent-ubuntu16.04:4.0.2.0-35


sudo docker push localhost:5000/contrail-controller-ubuntu16.04:4.0.2.0-35
sudo docker push localhost:5000/contrail-analytics-ubuntu16.04:4.0.2.0-35
sudo docker push localhost:5000/contrail-kube-manager-ubuntu16.04:4.0.2.0-35
sudo docker push localhost:5000/contrail-kubernetes-agent-ubuntu16.04:4.0.2.0-35
sudo docker push localhost:5000/contrail-analyticsdb-ubuntu16.04:4.0.2.0-35
sudo docker push localhost:5000/contrail-agent-ubuntu16.04:4.0.2.0-35
