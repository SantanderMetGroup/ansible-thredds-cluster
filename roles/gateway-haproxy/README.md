Role haproxy-gateway-tds
========================

This role completes the configuration of HAProxy, setting the environment to load balance TDS instances, by defining Access Control Lists (ACLs) and the corresponding backend pools in order to perform the mapping of URIs and make the balancing decision depending on the HTTP request. It also sets cookie configuration to perform sticky sessions.


Dependencies
------------

Not dependencies explicitly defined, but this role must be run on top of `haproxy` role.

Role Variables
--------------

catalog_backend: Name of the backend for main catalog requests
restricted_backend: Name of the backend for restricted requests (authentication needed)

Role usage
----------

It is required that the following variables are declared in this or other roles: haproxy\_conf\_file, default\_backend
