# ansible-opendap-cluster
Ansible playbooks for deployment of opendap cluster

## Playbooks

- provision.yml: This playbook creates an initial configuration in the remote machine. 
> You must ensure which lines you comment in ansible.cfg file depends on operating system you are working. 

- reload_machine.yml: Run this playbook when you shutdown and start your machine (`vagrant halt` & `vagrant up`) or when you reload it(`vagrant reload`). 

- deploy_tds.yml: Run this playbook if you want to deploy a scenario with N TDS instances (`ansible-playbook deploy_tds.yml`).

- deploy_httpd_tds_jk.yml: Run this playbook if you want to deploy a scenario with a httpd server working as a load balancer and N TDS instances in workers. The method to connect the load balancer with TDS instances is by module jk, using AJP protocol (`ansible-playbook deploy_httpd_tds_jk.yml`).