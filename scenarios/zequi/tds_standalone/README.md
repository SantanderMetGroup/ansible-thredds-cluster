# Scenario of a standalone THREDDS Data Server

This scenario deploys a sandbox, using the framework provided by TDS Collections, that contains:

- A THREDDS instance available at http://localhost:8080/thredds by default
- content/thredds is available in the root directory where you deployed the sandbox
- toolsUI jar
- ./toolsUI inits the toolsUI interface in the background
- ./ncjdump is a shorcut to `java -cp toolsUI.jar ucar.nc2.NCdumpW "$@"`

## Usage in localhost

1. `git clone --recursive -b devel https://github.com/SantanderMetGroup/ansible-thredds-cluster`
1. `cd ansible-thredds-cluster/scenarios/zequi/tds_standalone`
1. `virtualenv virtualenv`
1. `source virtualenv/bin/activate`
1. `pip install --upgrade pip setuptools`
1. `pip install ansible==2.5`
1. `./run.sh -h`
1. Example: `./run.sh -r ~/sandbox -c ~/work/TDSSPOCK/catalogs -d ~/work/TDSSPOCK/datasets`
1. (in web browser) localhost:8080/thredds
1. After adding new content to the `data` directory: `./run.sh -r ~/sandbox -c ~/work/TDSSPOCK/catalogs -d ~/work/TDSSPOCK/datasets -u`

## Usage in vagrant

Vagrantfile is provided if you want to test the deployment without polluting your system. The default ip for the virtual machine is '192.168.50.10'.

Note that the Vagrant file defines two hosts, ubuntu and centos, using the same IP. They are intended to be used separately.

## Scenario's variables

- root: Default is "/tmp/sandbox"
- catalogs_path: Default is "data/catalogs"
- datasets_path: Default is "data/datasets"
