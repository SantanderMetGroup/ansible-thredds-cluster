# Role jk-gateway

Here follows the documentation of the role jk-gateway. This role deploys mod_jk in order to act as a reverse proxy for the TDS cluster. It can be used with an existing httpd installation or after executing the httpd role.

## Variables

- mod\_jk\_version: "1.2.43"
- mod\_jk\_filename\_unarchive: "tomcat-connectors-{{ mod\_jk\_version }}-src"
- mod\_jk\_filename: "{{ mod\_jk\_filename\_unarchive }}.tar.gz"
- mod\_jk\_mirror: http://archive.apache.org/dist/tomcat/tomcat-connectors/jk
- mod\_jk\_download\_url: "{{ mod\_jk\_mirror }}/{{ mod\_jk\_filename }}"
- mod\_jk\_src: "{{ ansible\_env.HOME }}/mod\_jk\_src"

### Underlying httpd installation

These variables control the deployment of the reverse proxy based on the underlying httpd installation. Default values assume that httpd has been installed using one of the provided httpd roles or that httpd has been installed from system packages.

- mod\_jk\_conf\_path: "{{ httpd\_server\_root | default('/etc/httpd') }}/conf.d"
- mod\_jk\_shm: "{{ httpd\_server\_root | default('/etc/httpd') }}/logs/mod\_jk.shm"
- mod\_jk\_log: "{{ httpd\_server\_root | default('/etc/httpd') }}/logs/mod\_jk.log"
- mod\_jk\_static\_catalog: True
- mod\_jk\_status\_passwd: "{{ mod\_jk\_conf\_path }}"

The "mod_jk_static_catalog" variable is used to indicate if the role should create static html files imitating THREDDS html catalog files in the reverse proxy. It is true by default and explicitly set to false in the esgf scenario.

The "mod_jk_status_passwd" variable sets the path of the .htpasswd file that contains the user and password for the login in the jk status worker.

## Doc

The 'authenticator' worker is used to perform the authentication always with the same worker, using sticky-session, I'm not sure if it's needed, I have to test it.
