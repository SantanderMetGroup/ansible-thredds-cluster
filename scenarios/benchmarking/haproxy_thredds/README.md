# HAProxy + THREDDS#

In this scenario, we have two servers with two Tomcat instances each (instance1 and instance2, running THREDDS). 
Clients' requests are load balanced at Application Level (L7 in OSI model) using __HAProxy__, discriminating the URI to select which pool of servers redirect the request to (depending on, for example, the collection of datasets requested).

Persistency is achieved with _sticky sessions_: HAProxy appends a small amount of information in the cookie passed to the client, so the Load Balancer knows to which server it has to pass the request.

## Diagram ##
![Diagram HAProxy](./haproxy_diagram.png)
