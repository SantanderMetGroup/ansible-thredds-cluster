# Nginx + Memcached #

In this scenario, we have two servers with two Tomcat instances each (instance1 and instance2, running THREDDS). Clients' requests are load balanced at Application Level (L7 in OSI model) using Nginx, 
discriminating the URI to select which pool of servers redirect the request to (depending on, for example, the collection of datasets requested).

In addition to that, memcached is configured so Tomcat instances on different servers are able to keep track of client's session in case of a server's fault.

## Diagram ##
![Diagram ipvsadm_memcached](./diagrams/ipvsadm_memcached.png)
