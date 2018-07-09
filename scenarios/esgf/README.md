# Scenario for ESGF

## Usage

1. `svn co PATH_TO_TDSSPOCK_SVN_REPO .`
1. `ansible-playbook main.yml --ask-vault-pass`
1. `ansible-playbook main.yml --ask-vault-pass --tags update_catalogs`

## Doc

ssh -L 4119:wn019:18008 -L 4120:wn020:18008 -L 4019:wn019:8000  -L 4020:wn020:8000 ui.macc.unican.es
