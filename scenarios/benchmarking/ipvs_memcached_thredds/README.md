# IPVS + Memcached + THREDDS#

In this scenario, we have two servers with two Tomcat instances each (instance1 and instance2, running THREDDS). 
Client's requests are load balanced at Transport Level (L4 in OSI model), with __Direct Server Return scheme__, using IPVS; so the reply from the server goes directly to the client bypassing the load balancer.

In addition to that, memcached is configured so Tomcat instances on different servers are able to keep track of a client's session in case of a server fault. Also, with __keepalived__ the load balancer is able to maintain
the pool of servers acording to their status using periodic health checks, removing a server from the backend in case of fault and bringing it back in case of recovery.

## Helpful commands

Output of statistics information of IPVS:
``sudo ipvsadm -ln --stats``

```
IP Virtual Server version 1.2.1 (size=4096)
Prot LocalAddress:Port               Conns   InPkts  OutPkts  InBytes OutBytes
-> RemoteAddress:Port
TCP  172.28.128.6:8080                 6    25425        0  1324596        0
-> 172.28.128.7:8080                   3    10309        0   536991        0
-> 172.28.128.8:8080                   3    15116        0   787605        0
```
## Diagram ##
![Diagram ipvs_memcached](./ipvs_memcached_diagram.png)

