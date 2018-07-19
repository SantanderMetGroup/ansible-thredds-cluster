# Scenario spock

This scenario deploys the THREDDS Clustering in top of the test ESGF node deployed in spock. It serves as a use case for testing the THREDDS Clustering together with ESGF. Additionally, this scenario also creates mod_jk workers that allow access to the /tds5 and /udg-tap through spock.meteo.unican.es.

## Usage

1. `svn co PATH_TO_TDSSPOCK_SVN_REPO .`
1. `ansible-playbook main.yml --ask-vault-pass`
1. `ansible-playbook main.yml --ask-vault-pass --tags update_catalogs`

## Doc

ssh -L 4119:wn019:18008 -L 4120:wn020:18008 -L 4019:wn019:8000  -L 4020:wn020:8000 ui.macc.unican.es
