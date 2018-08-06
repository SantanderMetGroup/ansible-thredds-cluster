Role nginx-tds
=========

This role is used by the TDS servers to register in the load balancer.

Dependencies
------------

Although dependencies are not explicitly defined in its `meta/` directory, this role is supposed to be run after `nginx-gateway-tds` role is executed on the load balancer.

Role usage
----------
In order to work properly, this role requires the following variables to be declared as facts by the load balancer in its nginx installation/deployment
role: nginx\_conf\_file\_path, default\_backend, ansible\_become.

