Role gateway-nginx
======================

This role completes the configuration of Nginx by including in the configuration file the definition of the *upstreams* and their corresponding *location* blocks using the information provided in the deployment model in order to balance TDS instances.


Role Variables
--------------

* `catalog_upstream`: Name of the upstream for main catalog request
* `restricted_upstream`: Name of the upstream for restricted requests (authentication needed)

Dependencies
------------

Although no explicit dependencies are defined, this role is supposed to be run on top of `nginx`.

