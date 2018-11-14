# Scenario for ESGF F2F 2018

Three vagrant machines are provided:

- esgf - Machine where the ESGF data node and Ansible will be installed.
- server 1 and 2 - Two servers where TDS will be installed.

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

# Install ESGF node (https://github.com/ESGF/esgf-installer/wiki/ESGF-Installation-Using-Autoinstaller)
cd /usr/local/bin
wget -O esg-bootstrap http://distrib-coffee.ipsl.jussieu.fr/pub/esgf/dist/2.7/1/esgf-installer/esg-bootstrap --no-check-certificate
chmod 555 esg-bootstrap
./esg-bootstrap

cp /root/ansible-thredds-cluster/scenarios/f2f/esg-autoinstall.conf /usr/local/etc/esg-autoinstall.conf
script -c '/usr/local/bin/esg-autoinstall' installation.log

# Install Ansible
cd /root/ansible-thredds-cluster/scenarios/f2f
source /usr/local/conda/bin/activate esgf-pub
pip install ansible==2.5
ansible-playbook test-publication.yml # This step is not necessary, catalogs are already generated
ansible-playbook main.yml
ansible-playbook main.yml --tags restart
```
