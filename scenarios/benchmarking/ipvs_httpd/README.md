# IPVS #

In this scenario, we have two servers with two Tomcat instances each (instance1 and instance2, running THREDDS). Client's requests are load balanced at Level 4, with Direct Server Return scheme, using IPVS; so the reply from the server goes directly to the client bypassing the load balancer.


## Diagram ##
![Diagram ipvs](./ipvs_diagram.png)

