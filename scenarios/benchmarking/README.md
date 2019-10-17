# Benchmarking #

In this scenario, different load balancing schemes are proposed with different solutions for availability, persistency, etc.

## HAProxy + THREDDS ##
HAProxy performs load balancing at Application Level (L7 in OSI model) mapping the URI from the request to a specific server or pool of servers (depending on, for example, the collection of datasets
requested) using HAProxy's ACLs. In addition to that, HAProxy performs periodic health checks to monitor the backend and keep a proper list of available servers.

Persistency is achieved using _sticky sessions_: HAProxy appends a small amount of information in the cookie passed to the client, so the Load Balancer knows to which server it has to pass the request.

![Diagram HAProxy](./haproxy_thredds/haproxy_diagram.png)

## HAProxy + Memcached + THREDDS ##
HAProxy performs load balancing at Application Level (L7 in OSI model) mapping the URI from the request to a specific server or pool of servers (depending on, for example, the collection of datasets
requested) using HAProxy's ACLs. In addition to that, HAProxy performs periodic health checks to monitor the backend and keep a proper list of available servers.

[Memcached Session Manager](https://github.com/magro/memcached-session-manager) is used as a session manager for Tomcat instances. It can be configured in _sticky_ mode or _non-sticky_ mode, depending on the load balancer's persistence configuration. For further details,
plase read [the scenario's README](haproxy_memcached_thredds/README.md).

![Diagram HAProxy_Memcached](./haproxy_memcached_thredds/haproxy_memcached_diagram.png)


## IPVS + THREDDS ##
IPVS performs load balancing at Transport Level (L4 in OSI model) with a Direct Server Return (DSR) scheme, so the server is able to answer directly to the client bypassing the load balancer. Although this 
scheme is expected to perform much better than the others thanks to that bypassing, it lacks the capacity to achieve persistency/session replication and to monitor the backend (which is fixed in 
[ipvs_memcached](./ipvs_memcached), using memcached and keepalived respectively).


![Diagram IPVS](./ipvs_thredds/ipvs_diagram.png)

## IPVS + Memcached + THREDDS ##
Here, IPVS performs load balancing at Transport Level (L4 in OSI model) with a Direct Server Return (DSR) scheme, so the server is able to answer directly to the client bypassing the load balancer. Also,
using Keepalived the load balancer is able to remove a server from the backend list when a fault occurs and adds it back when it recovers, using periodic health checks. In addition to that, [Memcached Session Manager allows 
for session replication between servers](https://github.com/magro/memcached-session-manager).

![Diagram IPVS_Memcached](./ipvs_memcached_thredds/ipvs_memcached_diagram.png)

## IPVS + HTTPD ##
In this scenario, IPVS balances at Transport Level (L4 in OSI model) requests to two servers running Apache's httpd webserver using __Direct Server Return__, so the response from the servers bypasses 
the load balancer and goes directly to the client.

Keepalived is used as well to keep the backend list updated using periodic health checks.

![Diagram_IPVS_httpd](./ipvs_httpd/ipvs_httpd_diagram.png)

## Nginx + Memcached + THREDDS ##
Nginx performs load balancing at Application level (L7 in OSI model) mapping the URI from the request to a sepecific server or pool of servers (depending on, for example, the collection of datasets
requested). In addition to that, Nginx performs periodic health checks to monitor the backend and keep a proper list of available servers. An extra advantadge of using Nginx as the load balancer, is that
it can be also used as a web server to serve static content such as images, css files, etc. reducing overall network load.

Using _sticky sessions_ with Nginx is an option only included in the paid version, so [Memcached Session Manager](https://github.com/magro/memcached-session-manager) is used to allow for session replication between servers.

![Diagram Nginx_Memcached](./nginx_memcached_thredds/nginx_memcached_diagram.png)

