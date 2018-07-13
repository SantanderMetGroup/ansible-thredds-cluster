# Role jk-gateway-tds

This role further configures the mod_jk deployed by the role jk-gateway by registering the appropriate mod_jk workers and urimaps using the information defined in the collections and tds_instances variables. It also creates the static resources that will be served by the gateway instead of the backend TDS instances.

## Role dependencies

- jk-gateway

## Role usage

This role requires you to define the following variables, except that they are defined by other roles:

- httpd\_document\_root - Used in tasks and in templates
- httpd\_port - Used in templates
- collections - Used in tasks

## Variables

None.

## Documentation

Tasks in this role are separated from the jk-gateway in order to allow other applications, apart from TDS, to be reverse proxied, i.e. TAP.
