# Linux Virtual Server - L4 load balancing (DSR) #

With this repository you will be able to build a virtual environment consistinga of two diferent networks. One of them (representing the Internet) has a single client who sends requests to a TDS service. In the other network there is a load balancer who distributes the requests between both Tomcat application servers at layer 4 with a Direct Server Return scheme. Between both networks there is just a router whose single purpose is to interconnect both networks (not NAT functions involved).


# Load Balancing Scheme #
All requests are directed towards the VIP (configured on the load balancer) so the load balancer redirects them towards the realservers depending on the load balancing scheme chosen (in this case, round robin).
The load balancer doesn't touch the packet at IP level (i.e. IP source and destiny addreses remain the same, client's and VIP respectively) but just changes the destiny MAC address with one of the realservers' interfaces. Thanks to an iptables rule added on the realservers they accept the packet and send the response directly to the client with the VIP address as source (via the router of course, the important thing here is that the load balancer is bypassed).

## Network Architecture ##

See [scheme.txt](scheme.txt) to understand the network definition.


### Interface ###
You can ignore *eth0* interfaces, they are built by Vagrant and don't matter at all considering the static routes we will configure with Ansible

### IP static routes ###
In order for DSR to work, all realservers should have the router as their default gateway.
As you can see, the load balancer does not have a proper route to the client defined in its routes table, but it's OK: **That's the best evidence DSR works!**

## Vagrantfile ##
In order to build the virtual environment you must type the following command:
`vagrant ssh --provision`

Besides the definitions of the machines, this Vagrantfile includes an Ansible provision block that **creates automatically the inventory file for Ansible** and runs a software provision playbook (*provision.yml*).


## configure.yml ##

With this playbook you will execute all the necessary orders to configure the load-balancers and the servers. Execute it with:
`ansible-playbook configure.yml --ask-vault-pass`

This playbook uses the following roles:
* **ipvsadm:** configures the load balancer.
* **iptables:** adds an iptables rule to the servers so they accept packets destined to the VIP (not configured in any of the server's interfaces)
* **ansible-miniconda-role:** deploys and configures miniconda on the servers
* **supervidord-conda:** deploys a python virtualenv in top of the miniconda installed by the role ansible-miniconda-role
* **tds:** deploys a tds instance inside the Tomcat server

### Test ###
You can test functionality by running the command `curl {VIP}:8080/thredds -L` from the client. This command makes an ordinary HTTP GET request (with the -L option you enable redirection from HTTP 302 response headers).

In the folder *exchange* you will find files that correspond to captures with *tcpdump* on different hosts and interfaces. Open them with a packet sniffer like **wireshark** (*recommended*)  or with `tcpdump -r {file}`.

This deployment also works for an internal client (i.e. a client on the same internal private network). You cant see that by typing `{VIP}:8080/thredds` on you internet browser. The only difference is that the response from the servers will be directly served to you rather than going through the router.
