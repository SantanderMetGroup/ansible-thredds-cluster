# Scenario standalone

This scenario deploys a THREDDS instance available at http://localhost:8080/thredds by default. It contains only an empty catalog.

## Requirements

1. ansible 2.5

## Usage in localhost

1. `git clone --recursive -b devel https://github.com/SantanderMetGroup/ansible-thredds-cluster`
1. `cd ansible-thredds-cluster/scenarios/zequi/standalone`
1. `./run.sh -h`
1. Deploy the TDS instance `./run.sh -r /tmp/sandbox deploy`
1. (in web browser) `localhost:8080/thredds`
1. Stop all the processes: `./run.sh -r /tmp/sandbox stop`
1. Start all the processes: `./run.sh -r /tmp/sandbox boot`

## Usage in vagrant

Vagrantfile is provided if you want to test the deployment without polluting your system. The default ip for the virtual machines are `192.168.50.10` and `192.168.50.11`.

1. `vagrant up`
1. `vagrant ssh ubuntu` or `vagrant ssh centos`
1. `./test.sh`

## Scenario's variables

- root: Default is "/tmp/sandbox"
