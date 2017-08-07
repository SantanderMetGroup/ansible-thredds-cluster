# Scenario for SMG

## Usage

1. git clone
2. cd scenarios/zequi/smg
3. virtualenv ansible --no-site-packages
4. source ansible/bin/activate
5. pip install ansible
6. vagrant up proxy hostA && vagrant reload
7. ansible-playbook deploy.yml -u vagrant 
8. (in web browser) proxy:8000/thredds and proxy:8000/status-jk (user and password is 'proxy', see proxy-secret.yml)
9. vagrant ssh proxy OR vagrant ssh hostA (to see how the deployment is performed)
10. edit catalogs in gws1/ or gws2/
11. ansible-playbook deploy.yml --tags update_catalogs (catalogs should be updated in the browser)
