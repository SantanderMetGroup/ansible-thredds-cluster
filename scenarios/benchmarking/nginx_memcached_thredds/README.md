# Nginx + Memcached + THREDDS#

In this scenario, we have two servers with two Tomcat instances each (instance1 and instance2, running THREDDS). Clients' requests are load balanced at Application Level (L7 in OSI model) using __Nginx__, 
discriminating the URI to select which pool of servers redirect the request to (depending on, for example, the collection of datasets requested). Nginx is a web server as well, serving static content
(images, css files, etc) to reduce overall network load.

In addition to that, __memcached__ is configured so Tomcat instances on different servers are able to keep track of client's session in case of a server's fault.

## Diagram ##
![Diagram nginx_memcached](./nginx_memcached_diagram.png)
