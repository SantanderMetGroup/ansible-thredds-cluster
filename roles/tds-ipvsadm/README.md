Role tds-ipvsadm
=========

This role is used by backend instances to register into LVS load balancer.


Role Variables
--------------

* `rip`: IP Address of the server's interface whose MAC will be the destiny of client's request after passing through LVS

Dependencies
------------

No dependencies explicitly defined, but this role must be run after running [ipvsadm](../ipvsadm) on the load balancer.
