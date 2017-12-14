# Scenario of a standalone THREDDS Data Server

## Usage

1. A public key pair with name 'id' (id_rsa and id_rsa.pub) is required (in .ssh directory)
1. git clone
3. git checkout devel
2. cd scenarios/zequi/tds_standalone
3. virtualenv ansible --no-site-packages
4. source ansible/bin/activate
5. pip install ansible
6. vagrant up hostA && vagrant reload
7. ansible-playbook provision.yml standalone.yml -u vagrant -i inventory --ask-vault-pass
8. (in web browser) 192.168.50.12:8080/thredds
9. vagrant ssh hostA (to see how the deployment is performed, 'supervisorctl' command is available)
10. edit catalogs in scenarios/zequi/tds_standalone/gws1/ and datasets in scenarios/zequi/tds_standalone/datasets/
11. ansible-playbook standalone.yml --tags update_catalogs (catalogs should be updated in the browser)
