# Scenario for ESGF F2F 2018

Three vagrant machines are provided:

- esgf - Machine where the ESGF data node and Ansible will be installed.
- server 1 and 2 - Two servers where TDS will be installed.

esgf machine deploys a local data,index,idp ESGF node with a user `pepito` with password `Cochecitos1!` with access to publish and acces data in the node (see [esgf-test](https://github.com/zequihg50/esgf-test)).

You may add `172.28.128.3 esgf.test.es` to your `/etc/hosts` to resolve the node hostname.

```bash
vagrant up esgf server1 server2
vagrant ssh esgf
```

In esgf machine:

```bash
# Disable SELinux
sudo su -
setenforce 0

cd /root
git clone -b devel --recursive https://github.com/SantanderMetGroup/ansible-thredds-cluster

# Install Ansible
cd /root/ansible-thredds-cluster/scenarios/f2f
source /usr/local/conda/bin/activate esgf-pub
pip install ansible==2.5
ansible-playbook main.yml
ansible-playbook main.yml --tags restart
```
