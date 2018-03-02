# Scenario for SMG

## Usage

1. A public key pair with name 'id' is required (in .ssh directory)
1. git clone
2. cd scenarios/zequi/smg
3. git checkout devel
3. virtualenv ansible --no-site-packages
4. source ansible/bin/activate
5. pip install ansible
6. vagrant up proxy hostA && vagrant reload
7. ansible-playbook provision.yml source.yml -u vagrant -i inventory --ask-vault-pass
8. (in web browser) 192.168.50.11:8000/thredds, 192.168.50.11:8000/status-jk, 192.168.50.11:8000/tap
9. vagrant ssh proxy OR vagrant ssh hostA (to see how the deployment is performed, 'supervisorctl' command is available)
10. edit catalogs in gws1/ or gws2/
11. ansible-playbook deploy.yml --tags update_catalogs (catalogs should be updated in the browser)
