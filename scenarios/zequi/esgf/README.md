# Scenario for ESGF

## Usage

1. git clone
2. cd scenarios/zequi/esgf
3. git checkout devel
3. virtualenv ansible --no-site-packages
4. source ansible/bin/activate
5. pip install ansible
7. ansible-playbook main.yml --ask-vault-pass
11. ansible-playbook main.yml --tags update_catalogs

## Vars for the scenario

1. catalogs_path: Local path to catalogs. Default: "catalogs".
1. datasets_path: Local path to datasets. Default: "datasets".
