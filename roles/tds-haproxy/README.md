Role haproxy-tds
=========

With this roles, servers register at their corresponding backend in the load balancer's configuration file.

Role Variables
--------------
* tds_port: port where the TDS instance will be listening to

Dependencies
------------

Not explicit dependencies defined, but this role must be run after running either the haproxy or the haproxy-bin role with the load balancer.

Role usage
------------

