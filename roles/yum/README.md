# yum

This role install the software specified in the variable `dependencies` (default value is `[]`) using the yum package manager.

Valid depedencies are:

- httpd
- jdk
- tomcat
- supervisor
- memcached

## httpd

```yaml
httpd_root: /etc/httpd
httpd_htdocs: /var/www/html
httpd_pid: "{{ httpd_root }}/run/httpd.pid"
httpd_conf: /etc/httpd/conf
httpd_conf_file: "{{ httpd_conf ~ '/httpd.conf' }}"
```

## jdk

```yaml
jdk_package_name: "java-1.8.0-openjdk"
jdk_root: "{{ '/usr/lib/jvm/java-8-oracle' if ansible_pkg_mgr == 'apt' else '/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.181-3.b13.el7_5.x86_64' }}"
```

## tomcat

```yaml
tomcat_base: /var/lib/tomcats
```

## supervisor

```yaml
supervisor_bin: "/usr/bin"
supervisor_etc: "/etc"
supervisor_var: "/var/log/supervisord"
supervisor_programs: "/etc/supervisord.d/"
```

## memcached

```yaml
```
