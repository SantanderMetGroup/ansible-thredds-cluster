# Scenario of a standalone THREDDS Data Server

This scenario deploys a standalone THREDDS server using the framework provided by TDS Collections. The deployment consists of a TDS instance that servers requests for a collection named 'test-collection'.

Vagrantfile is provided if you want to test the deployment without polluting your system. The default ip for the virtual machine is '192.168.50.10'.

The inventory file defines two hosts, localhost and vagrant. localhost will deploy the standalone TDS in your localhost and vagrant will deploy it in the vagrant virtual machine.

## Usage

1. `cd scenarios/zequi/tds_standalone`
1. `virtualenv virtualenv --no-site-packages`
1. `source virtualenv/bin/activate`
1. `pip install ansible`
1. (optional) `vagrant up`
1. `ansible-playbook standalone.yml --limit (localhost|vagrant)`
1. (in web browser) (localhost|192.168.50.10):8080/thredds
1. (to manage the tds process) `source tds_test/miniconda2/bin/activate udg` and `supervisorctl`
1. edit catalogs in data/catalogs and datasets in data/datasets
1. `ansible-playbook standalone.yml --tags update_catalogs` (manual restart is required to take effect)
