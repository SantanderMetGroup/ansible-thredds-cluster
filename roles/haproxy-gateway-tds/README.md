Role haproxy-gateway-tds
=========

This role completes the configuration of HAProxy by defining Access Control Lists (ACLs) and corresponding backend pools in order to perform the mapping of URIs and make 
the balancing decision depending on the request as well.


Dependencies
------------

Not dependencies explicitly defined, but this role must be run on top of a role that installs haproxy and partially templates the configuration file such as the roles haproxy` or `haproxy-bin`


Role usage
----------

It is required that the following variables are declared in this or other roles: haproxy\_conf\_file, default\_backend
