Role tds-nginx
=========

This role is used by the TDS instances to register on the Nginx load balancer.

Dependencies
------------

Although dependencies are not explicitly defined in its `meta/` directory, this role is supposed to be run after [gateway-nginx](../gateway-nginx) role is executed on the load balancer.


