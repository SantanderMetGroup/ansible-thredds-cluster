# Role httpd-bin

This role deploys and httpd server using the system package manager. Only works in yum based systems.

## Variables

- httpd\_server\_root: /etc/httpd
- httpd\_conf\_file: /etc/httpd/conf/httpd.conf
- httpd\_document\_root: /var/www/html
- httpd\_port: 80
- httpd\_dependencies: ["@Development tools", "httpd-devel", "apr", "apr-devel", "apr-util", "apr-util-devel"]

## Doc

