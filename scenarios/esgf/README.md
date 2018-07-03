# Scenario for ESGF

## Usage

1. git clone
1. cd scenarios/zequi/esgf
1. git checkout devel
1. virtualenv ansible --no-site-packages
1. source ansible/bin/activate
1. pip install ansible
1. svn co PATH_TO_TDSSPOCK_SVN_REPO .
1. ansible-playbook main.yml --ask-vault-pass
1. ansible-playbook main.yml --tags update_catalogs
