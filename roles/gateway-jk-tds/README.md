# Role gateway-jk-tds

This role further configures the mod_jk deployed by the role gateway-jk by registering the appropriate mod_jk workers and urimaps using the information defined in the collections and tds_instances variables. It also creates the static resources that will be served by the gateway instead of the backend TDS instances.

## Role dependencies

- gateway-jk

## Role usage

This role requires you to define the following variables, except that they are defined by other roles:

- httpd\_document\_root - Used in tasks and in templates
- collections - From the deployment model. Used in tasks

## Variables

None.

## Documentation

Tasks in this role are separated from the gateway-jk in order to allow other applications, apart from TDS, to be reverse proxied, i.e. TAP.
