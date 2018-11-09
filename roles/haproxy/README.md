Role haproxy
=========

This role implements an initial configuration of HAProxy templating the configuration file.

Requirements
------------

Role Variables
--------------

* `haproxy_user`: User that will run the Haproxy master process
* `haproxy_group`: Group _haproxy\_user_ belongs to
* `haproxy_mode`: Load balancing mode (must be _http_ or _tcp_)
* `haproxy_chroot`: Directory _haproxy\_user_ will lockself itself into before dropping privileges
* `default_frontend`: Name of the default frontend, where the load balancer will listen
* `haproxy_balance_mode`: Load Balancing Scheme ('roundrobin', 'leastconn','uri','source'... read [HAPRoxy docs](http://cbonte.github.io/haproxy-dconv/1.8/configuration.html#4.2-balance) for further info)
* `bind_address`: IP address HAProxy will be listening to (use '*' for all interfaces)
* `bind_port`: TCP port HAProxy will be listening to.

Dependencies
------------

This role assumes you have previously installed HAProxy using either[yum](haproxy) or [source](haproxy) roles, as it uses some of their variables.

References
----------

[HAProxy Documentation](http://cbonte.github.io/haproxy-dconv/1.8/configuration.html)



