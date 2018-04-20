# Scenario of a standalone THREDDS Data Server

This scenario deploys a sandbox, using the framework provided by TDS Collections, that contains:

- A THREDDS instance available at http://localhost:8080/thredds by default
- content/thredds is available in the root directory where you deployed the sandbox
- toolsUI jar
- ./toolsUI inits the toolsUI interface in the background
- ./ncjdump is a shorcut to `java -cp toolsUI.jar ucar.nc2.NCdumpW "$@"`

## Usage in localhost

This example will deploy the sandbox in your home directory, in the path tds-sandbox. You can change the directory where the sandbox is deployed by setting a different value to the `-e` param of the `ansible-playbook` command.

1. `git clone`
1. `cd scenarios/zequi/tds_standalone`
1. `virtualenv virtualenv --no-site-packages`
1. `source virtualenv/bin/activate`
1. `pip install ansible`
1. `ansible-playbook standalone.yml --limit localhost -e root=~/tds-sandbox`
1. (in web browser) localhost:8080/thredds
1. After adding new content to the `data` directory: `ansible-playbook standalone.yml --limit localhost -e root=~/tds-sandbox --tags update_catalogs`

## Usage in vagrant

Vagrantfile is provided if you want to test the deployment without polluting your system. The default ip for the virtual machine is '192.168.50.10'.

## Scenario's variables

- root: Default is "/tmp/sandbox"
- catalogs_path: Default is "data/catalogs"
- datasets_path: Default is "data/datasets"
