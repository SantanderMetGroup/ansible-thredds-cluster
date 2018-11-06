Role nginx-gateway-tds
======================

This role completes the configuration of nginx by including in the configuration file the definition of the *upstreams* and their corresponding *location* blocks
using the information provided in the deployment model.



Role Variables
--------------

default\_backend: The name of the default backend, where non service-related requests will go to.

Dependencies
------------

Although no explicit dependencies are defined, this role is supposed to be run on top of a role that installs nginx on the load balancer (Role nginx or Role nginx-bin)

