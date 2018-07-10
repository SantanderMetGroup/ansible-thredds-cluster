# Linux Virtual Server - L4 load balancing (DSR) #

With this repository you will be able to build a virtual environment consisting in two diferent networks. One of them represents the Internet and has a single client who sends requests to a TDS service. In the other network there is a load balancer who distributes the requests between both Tomcat application servers at layer 4 with a Direct Server Return scheme. Between both networks there is just a router whose single purpose is to interconnect both network (not NAT functions involved).


## Network Architecture ##

See [scheme.txt](scheme.txt) to understand the network definition.

## Vagrantfile ##
In order to build the virtual environment you must type the following command:
`vagrant ssh --provision`

Besides the definitions of the machines, this Vagrantfile includes an Ansible provision block that **creates automatically the inventory file for Ansible** and runs a software provision playbook (*provision.yml*).


## configure.yml ##

With this playbook you will execute all the necessary orders to configure the load-balancers and the servers. Execute it with:
`ansible-playbook configure.yml --ask-vault-pass`

This playbook uses the following roles:
* ipvsadm: configures the load balancer.
* iptables: adds an iptables rule to the servers so they accept packets destined to the VIP (not configured in any of the server's interfaces)
* ansible-miniconda-role: deploys and configures miniconda on the servers
* supervidord-conda: deploys a python virtualenv in top of the miniconda installed by the role ansible-miniconda-role
* tds: deploys a tds instance inside the Tomcat server

### Test ###
You can test functionality by running the command `curl {VIP}:8080/thredds -L` from the client. This command makes an ordinary HTTP GET request (with the -L option you enable redirection from 302 response headers).

In the folder *exchange* you will find files that correspond to captures with *tcpdump* on different hosts and interfaces. Open them with a packet sniffer like **wireshark** (*recommended*)  or with `tcpdump -r {file}`.



