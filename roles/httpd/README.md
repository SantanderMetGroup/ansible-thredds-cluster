# Role httpd

This role deploys an httpd server, either from source or from system binaries.

## Variables

### Public vars

Vars that must be considered by the user of the role.

- httpd\_server\_root - Optional. Directory under httpd will be deployed. Default (for source): {{ ansible\_env.HOME }}/httpd. Default (for binary): /etc/httpd
- httpd\_version - Optional. Default: 2.4.25
- httpd\_port - Optional. Default: 8000
- httpd\_document\_root: Optional. Default (for source): {{ httpd\_server\_root }}/htdocs. Default (for binary): "/var/www/html"
- httpd\_conf\_dir: Optional. Default: {{ httpd\_server\_root }}/conf.
- httpd\_src - Optional. Where to keep src files. Default: {{ httpd\_server\_root }}/src
- httpd\_source - Optional. If true, install from source else install from binaries. Default: True.

### Private vars

Vars only interesting for developers of the role.

- httpd\_version\_major: "{{ httpd\_version|truncate(3, False, '', 0) }}"
- httpd\_mirror: https://archive.apache.org/dist/httpd/
- httpd\_filename\_unarchive: "httpd-{{ httpd\_version }}"
- httpd\_filename: "{{ httpd\_filename\_unarchive }}.tar.gz"
- httpd\_download\_url: "{{ httpd\_mirror }}/{{ httpd\_filename }}"
- apr\_version: "1.5.2"
- apr\_filename\_unarchive: "apr-{{ apr\_version }}"
- apr\_filename: "{{ apr\_filename\_unarchive }}.tar.gz"
- apr\_mirror: http://archive.apache.org/dist/apr
- apr\_download\_url: "{{ apr\_mirror }}/{{ apr\_filename }}"
- apr\_install\_base: "{{ httpd\_server\_root }}"
- apr\_util\_version: "1.5.4"
- apr\_util\_filename\_unarchive: "apr-util-{{ apr\_util\_version }}"
- apr\_util\_filename: "{{ apr\_util\_filename\_unarchive }}.tar.gz"
- apr\_util\_mirror: http://archive.apache.org/dist/apr
- apr\_util\_download\_url: "{{ apr\_util\_mirror }}/{{ apr\_util\_filename }}"
- apr\_util\_install\_base: "{{ httpd\_server\_root }}"
- pcre\_version: "8.40"
- pcre\_filename\_unarchive: "pcre-{{ pcre\_version }}"
- pcre\_filename: "{{ pcre\_filename\_unarchive }}.tar.gz"
- pcre\_mirror: http://ftp.cs.stanford.edu/pub/exim/pcre
- pcre\_download\_url: "{{ pcre\_mirror }}/{{ pcre\_filename }}"
- pcre\_install\_base: "{{ httpd\_server\_root }}"

## Doc

.htpasswd for /status-httpd is currently stored in {{ httpd\_document\_root }}.
