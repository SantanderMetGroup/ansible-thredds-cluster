# Role tds-gateway

Here follows the documentation of the role tds-gateway. This role deploys mod_jk in order to act as a reverse proxy for the TDS cluster. It can be used with an existing httpd installation or after executing the httpd role.

## Variables

### Public vars

Vars that must be considered by the user of the role.

- httpd\_conf - Mandatory. Path to httpd.conf, e.g. /etc/httpd/conf
- mod\_jk\_conf\_dir - Mandatory. Path to mod_jk conf files.
- mod\_jk\_shm - Mandatory. Path to .shm file.
- mod\_jk\_log - Mandatory. Path to log file.
- mod\_jk\_configure - Mandatory. mod_jk configure options.
- mod\_jk\_status\_passwd - Optional. Path to mod_jk status .htpasswd file. Default is {{ mod\_jk\_conf\_dir }}.
- mod\_jk\_version - Optional. Default is "1.2.42"
- mod\_jk\_src - Optional. Path to mod_jk sources. Default is {{ ansible\_env.HOME }}/mod\_jk.

### Private vars

Vars only interesting for developers of the role.

- load\_balancer\_module: mod\_jk
- mod\_jk\_filename\_unarchive: "tomcat-connectors-{{ mod\_jk\_version }}-src"
- mod\_jk\_filename: "{{ mod\_jk\_filename\_unarchive }}.tar.gz"
- mod\_jk\_mirror: http://archive.apache.org/dist/tomcat/tomcat-connectors/jk
- mod\_jk\_download\_url: "{{ mod\_jk\_mirror }}/{{ mod\_jk\_filename }}"
- httpd\_document\_root: Only defined when httpd role is executed first.
- http\_source: Only defined when httpd role is executed first.

## Doc

The 'authenticator' worker is used to perform the authentication always with the same worker, using sticky-session, I'm not sure if it's needed, I have to test it.
