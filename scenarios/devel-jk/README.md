# Scenario devel-jk

This scenario serves as use case for development and testing of the TDS+`mod_jk` gateway infrastructure. It also serves as an example of different use cases that can be implemented.

## Requirements

1. vagrant
1. ansible 2.5

## Documentation

The main files in this directory are "source.yml" and "binary.yml". These playbooks deploy a httpd+mod\_jk reverse proxy in the ansible host "proxy", that forward requests to a backend consisting on two hosts, "hostA" and "hostB", each running a tds instance. Configuration of variables can be found in the group\_vars directory (see [Ansible docs](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html#group-and-host-variables)).

test-authentication.yml is a playbook that configures a simple setup in the THREDDS instances for testing of authentication and authorization. This playbooks creates a user named "alice" with password "1234" who has access to the datasets in the collection2 (see data/ directory).

The inventory file, named inventory, defines the three hosts involved in this scenario. The "test-simple" group is only used for quick testing avoiding the deployment of hostB.

The data directory contains sample THREDDS catalog files and NetCDF datasets.

## Usage

1. vagrant up && vagrant reload
1. ansible-playbook (source.yml|binary.yml) --ask-vault-pass [--limit test-simple]
1. (in web browser) localhost:9000/thredds, localhost:9000/status-jk

## Infrastructure description

- CentOS 7 vagrant machines
- httpd 2.4
- tomcat 8
- tds 4.6

## Networking

Virtual machines are configured to use an internal network (see Vagrantfile) and each virtual machine has the following configuration:

- proxy - eth1, ip: 192.168.50.10
- hostA - eth1, ip: 192.168.50.11
- hostB - eth1, ip: 192.168.50.12

The following ports are forwarded from the host to the guests:

- host 9000 -> proxy 8080
- host 9001 -> hostA 8080
- host 9002 -> hostB 8080

## JPDA debug

Tomcat instances are configured to be debugged used JPDA. JPDA listens in the port 8000 in both hostA and hostB.

