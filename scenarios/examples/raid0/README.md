# Scenario for SMG

![Deployment diagram](doc/raid0.png)

## Usage

1. git clone
2. cd scenarios/examples/raid0
3. mkdir downloads
4. vagrant up && vagrant reload
5. ansible-playbook deploy_httpd.yml --ask-vault-pass (pass is 'proxy')
6. ansible-playbook deploy_tds.yml
7. vagrant ssh worker1 (same with worker2)
8. /home/vagrant/update-proxy.py (same with worker2)
9. (in host's browser) 192.168.50.11:8008/status-proxy and 192.168.50.11:8008/thredds
