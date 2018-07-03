# Role httpd-bin

This role deploys and httpd server using the system package manager. At the moment, it only works in yum based systems.

## Role dependencies

None.

## Variables

- `httpd_server_root`: `/etc/httpd`
- `httpd_conf_file`: `/etc/httpd/conf/httpd.conf`
- `httpd_document_root`: `/var/www/html`
- `httpd_port`: `80`
- `httpd_dependencies`: `["@Development tools", "httpd-devel", "apr", "apr-devel", "apr-util", "apr-util-devel"]`

## Documentation

