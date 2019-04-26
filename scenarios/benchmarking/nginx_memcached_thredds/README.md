# Nginx + Memcached + THREDDS #

In this scenario, we have two servers with two Tomcat instances each (instance1 and instance2, running THREDDS). Clients' requests are load balanced at Application Level (L7 in OSI model) using __Nginx__, 
discriminating the URI to select which pool of servers redirect the request to (depending on, for example, the collection of datasets requested). Nginx is a web server as well, serving static content
(images, css files, etc) to reduce overall network load.

In addition to that, [Memcached Session Manager](https://github.com/magro/memcached-session-manager) is configured so Tomcat instances on different servers are able to keep track of client's session in 
case of a server's fault. As using _sticky sessions_ for persistency is not available with the free version of Nginx, MSM is configured with _non-sticky_ mode; in this mode, the Tomcat instance randomly 
chooses one Memcached node as the primary node and the logical "next" node  one as the backup node. Sessions are not tied to any particular server, so session information is not stored locally but in 
these two Memcached nodes.

## References ##
* [Memcached Session Manager Docs - Non-sticky mode](https://github.com/magro/memcached-session-manager/wiki/FAQ#how-are-sessions-stored-in-memcached-in-non-sticky-mode)

## Diagram ##
![Diagram nginx_memcached](./nginx_memcached_diagram.png)
