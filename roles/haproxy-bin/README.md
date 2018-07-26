Role haproxy-bin
=========

Installs HAProxy on the remote host, copies the configuration file and runs it.

Requirements
------------
No requirements

Role Variables
--------------
* haproxy_user - Value of the `user` parameter passed to the `global` section of HAProxy's configuration file. User that will run the service.
* haproxy_group - Value of the `group` parameter passed to the `global` section of HAProxy's configuration file. Group the user belongs to.
* haproxy_mode - Value of the `mode` parameter passed to the `listen` section of HAProxy's configuration file. Mode on which HAProxy will work (can be *http* or *tcp*)
* haproxy_mode - Value of the `chroot` parameter passed to the `global` section of HAProxy's configuration file. Equivalent to `chroot` that will be executed by the user before dropping privileges.
* haproxy\_bind\_address and haproxy\_bind\_port - Bind parameters passed to the `listen`section. IP address ('\*' stands for all interfaces in the host) and port the load balancer will be listening on.
* haproxy\_balance\_mode - Balance algorithm the load balancer will execute.
* haproxy_servers - Array of servers that will be located in the backend, each of them defined by its listening socket (IP address + port)

Dependencies
------------
No dependencies

Example Playbook
----------------

~~~
    - hosts: load-balancer
      gather_facts: False
      become: True
      roles:
         - role: haproxy_pablo
~~~
