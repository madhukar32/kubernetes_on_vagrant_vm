# kubernetes_on_vagrant_vm
Bringing up a kubernetes cluster on vagrant VM

### Prerequisites

* Operating system: Ubuntu 16.04.2  (To-do: Centos 7.4)

### Installing the infra (vagrant and virtualbox)

Use below command to install packages needed by the infra


Check below links for available vagrant versions

[Vagrant releases](https://github.com/hashicorp/vagrant/releases)


```bash
  export VAGRANT_VERSION='2.1.0'
	./scripts/install_infra.sh
```

### Bringing up the vagrant VM

1. Refer [readme for vagrantfile](src/README.md), make changes according to it
2. Use `vagrant up` to bring up your environment
