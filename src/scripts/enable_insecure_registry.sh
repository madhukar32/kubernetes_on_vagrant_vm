#!/bin/bash -eux

#login as root
sudo bash -c 'cat <<EOF >>/etc/docker/daemon.json
{
"insecure-registries" : ["10.87.65.230:5000"]
}
EOF'

#restart docker 
sudo service docker restart
