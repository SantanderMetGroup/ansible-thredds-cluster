# Scenario of a standalone THREDDS Data Server

This scenario deploys a sandbox, using the framework provided by TDS Collections, that contains:

- A THREDDS instance available at http://localhost:8080/thredds by default
- content/thredds is available in the root directory where you deployed the sandbox
- toolsUI jar
- ./toolsUI inits the toolsUI interface in the background
- ./ncjdump is a shorcut to `java -cp toolsUI.jar ucar.nc2.NCdumpW "$@"`

The THREDDS instance is populated with the following data:

- THREDDS catalogs contained in `data/catalogs`
- Datasets contained in `data/datasets`
- A \<dataset\> entry is created in the main catalog for each file found in data/datasets, although this is not recursive

## Requirements

1. ssh key pair in your ~/.ssh directory and authorized to ssh to localhost
1. ansible 2.5

## Usage in localhost

1. `git clone --recursive -b devel https://github.com/SantanderMetGroup/ansible-thredds-cluster`
1. `cd ansible-thredds-cluster/scenarios/zequi/tds_standalone`
1. `./run.sh -h`
1. Deploy the TDS instance `./run.sh -r /tmp/sandbox deploy`
1. (in web browser) `localhost:8080/thredds`
1. After adding new content to the `data` directory and perform only the update of the catalogs: `./run.sh -r /tmp/sandbox -u deploy`
1. Stop all the processes: `./run.sh -r /tmp/sandbox stop`
1. Start all the processes: `./run.sh -r /tmp/sandbox boot`

## Usage in vagrant

Vagrantfile is provided if you want to test the deployment without polluting your system. The default ip for the virtual machines are `192.168.50.10` and `192.168.50.11`.

1. `vagrant up`
1. `vagrant ssh ubuntu` or `vagrant ssh centos`
1. `./test.sh`

## Scenario's variables

- root: Default is "/tmp/sandbox"
- catalogs\_path: Default is "data/catalogs"
- datasets\_path: Default is "data/datasets"
