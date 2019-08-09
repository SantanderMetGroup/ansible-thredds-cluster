# Scenario standalone

This scenario deploys a THREDDS instance available at http://localhost:8080/thredds by default.

## Requirements

1. ansible 2.7

## Usage in localhost

1. `git clone --recursive -b devel https://github.com/SantanderMetGroup/ansible-thredds-cluster`
1. `cd ansible-thredds-cluster/scenarios/standalone`
1. `ansible-playbook main.yml [-t (start|stop|clean|purge)]`

Want to test a ncml?

`ansible-playbook main.yml -e ncml="/path/to/local/ncml"`

Want to use ssl? Uncomment the ssl section from `main.yml`
