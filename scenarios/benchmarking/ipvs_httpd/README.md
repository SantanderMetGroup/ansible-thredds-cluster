# IPVS + HTTPD #

In this scenario, we have two servers running Apache's httpd webserver. Client's requests are load balanced at Level 4, with Direct Server Return scheme, using IPVS; hence the reply from the server goes
directly to the client bypassing the load balancer.

Using keepalived, the load balancer is able to perform periodic healthchecks to keep the backend list updated in case one server fails and/or comes back from failover.

## Diagram ##
![Diagram ipvs](./ipvs_diagram.png)

