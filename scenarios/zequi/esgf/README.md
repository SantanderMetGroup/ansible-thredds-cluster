# Scenario for ESGF

## Usage

1. A public key pair with name 'id_rsa' and 'id_rsa.pub' is required (in .ssh directory)
1. git clone
2. cd scenarios/zequi/esgf
3. git checkout devel
3. virtualenv ansible --no-site-packages
4. source ansible/bin/activate
5. pip install ansible
7. ansible-playbook main.yml -i inventory --ask-vault-pass
11. ansible-playbook main.yml --tags update_catalogs
