# ansible-opendap-cluster
Ansible playbooks for deployment of opendap cluster

## Steps

- The first time you create the machines:
	1. Create virtual machines. (`vagrant up`)
	2. Run provision.yml playbook (`ansible-playbook provision.yml`)
	3. Run the playbook of the scenario you want (`ansible-playbook scenario.yml`)

- If you reload or halt your machines:
	1. Run virtual machines. (`vagrant reload`) or (`vagrant halt` and `vagrant up`)
	2. Run reload_machine.yml playbook (`ansible-playbook reload_machine.yml`)
	3. Run the playbook of the scenario you want (`ansible-playbook scenario.yml`) 

## Playbooks

- provision.yml: Run this playbook when you create your machines. This playbook creates an initial configuration in the remote machine.

- reload_machine.yml: Run this playbook when you shutdown and start your machine (`vagrant halt` & `vagrant up`) or when you reload it(`vagrant reload`). This playbook ensure supervisor is running.

- deploy_tds.yml: Run this playbook if you want to deploy a scenario with N TDS instances (`ansible-playbook deploy_tds.yml`).

- deploy_httpd_tds_jk.yml: Run this playbook if you want to deploy a scenario with a httpd server working as a load balancer and N TDS instances in workers. The method to connect the load balancer with TDS instances is by module jk, using AJP protocol (`ansible-playbook deploy_httpd_tds_jk.yml`).