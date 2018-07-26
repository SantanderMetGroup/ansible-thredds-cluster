Role nginx-tds
=========

This role is used by the TDS servers to register in the load balancer.



Dependencies
------------

Although dependencies are not explicitly defined in its `meta/` directory, this role is supposed to be run after either `nginx` or `nginx-bin` roles is executed on the load balancer.
