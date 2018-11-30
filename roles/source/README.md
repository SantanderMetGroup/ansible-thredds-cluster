# Source

This role contains playbooks to install software from source. The list variable `dependencies` (`[]` by default) allows the user to select which software to install.

Valid depedencies are:

- httpd
- mod_jk
- jdk
- tomcat
- supervisor

## httpd

```yaml
httpd_root: "{{ ansible_env.HOME }}/httpd"

downloads_tmp: "{{ playbook_dir }}/downloads"

httpd_version: '2.4.25'
httpd_src: "{{ httpd_root }}/src"
httpd_major_version: "{{ httpd_version|truncate(3, False, '', 0) }}"
httpd_mirror: https://archive.apache.org/dist/httpd/
httpd_filename_unarchive: "httpd-{{ httpd_version }}"
httpd_filename: "{{ httpd_filename_unarchive }}.tar.gz"
httpd_download_url: "{{ httpd_mirror }}/{{ httpd_filename }}"
httpd_to_be_removed: ['build','build-1','icons','man','manual','src','include']

httpd_htdocs: "{{ httpd_root }}/htdocs"
httpd_conf: "{{ httpd_root }}/conf"
httpd_conf_file: "{{ httpd_conf }}/httpd.conf"
httpd_pid: "{{ httpd_root }}/logs/httpd.pid"

apr_version: "1.5.2"
apr_filename_unarchive: "apr-{{ apr_version }}"
apr_filename: "{{ apr_filename_unarchive }}.tar.gz"
apr_mirror: https://archive.apache.org/dist/apr
apr_download_url: "{{ apr_mirror }}/{{ apr_filename }}"
apr_install_base: "{{ httpd_root }}"

apr_util_version: "1.5.4"
apr_util_filename_unarchive: "apr-util-{{ apr_util_version }}"
apr_util_filename: "{{ apr_util_filename_unarchive }}.tar.gz"
apr_util_mirror: https://archive.apache.org/dist/apr
apr_util_download_url: "{{ apr_util_mirror }}/{{ apr_util_filename }}"
apr_util_install_base: "{{ httpd_root }}"

pcre_version: "8.40"
pcre_filename_unarchive: "pcre-{{ pcre_version }}"
pcre_filename: "{{ pcre_filename_unarchive }}.tar.gz"
pcre_mirror: https://ftp.pcre.org/pub/pcre
pcre_download_url: "{{ pcre_mirror }}/{{ pcre_filename }}"
pcre_install_base: "{{ httpd_root }}"
```

## jdk

```yaml
jdk_root: "{{ ansible_env.HOME }}/jdk"

jdk_version: '8u192'
jdk_filename_unarchive: "jre-{{ jdk_version }}-linux-x64"
jdk_filename: "{{ jdk_filename_unarchive }}.tar.gz"
jdk_mirror: http://download.oracle.com/otn-pub/java/jdk/
jdk_download_url: http://download.oracle.com/otn-pub/java/jdk/8u192-b12/750e1c8617c5452694857ad95c3ee230/jdk-8u192-linux-x64.tar.gz
jdk_header: "Cookie: oraclelicense=accept-securebackup-cookie"
```

## mod_jk

```yaml
downloads_tmp: "{{ playbook_dir }}/downloads"

mod_jk_version: "1.2.43"
mod_jk_filename_unarchive: "tomcat-connectors-{{ mod_jk_version }}-src"
mod_jk_filename: "{{ mod_jk_filename_unarchive }}.tar.gz"
mod_jk_mirror: http://archive.apache.org/dist/tomcat/tomcat-connectors/jk
mod_jk_download_url: "{{ mod_jk_mirror }}/{{ mod_jk_filename }}"

mod_jk_src: "{{ httpd_root }}/mod_jk_src"
mod_jk_conf: "{{ httpd_root }}/conf.d"
mod_jk_shm: "{{ httpd_root }}/logs/mod_jk.shm"
mod_jk_log: "{{ httpd_root }}/logs/mod_jk.log"
mod_jk_status: "{{ mod_jk_conf }}"
```

## supervisor

```yaml
downloads_tmp: "{{ playbook_dir }}/downloads"

# Virtualenv
venv_home: "{{ ansible_env.HOME }}/virtualenv"
venv_version: 15.1.0
venv_file_name: "virtualenv-{{ venv_version }}.tar.gz"
venv_file_url: "https://pypi.python.org/packages/d4/0c/9840c08189e030873387a73b90ada981885010dd9aea134d6de30cd24cb8/virtualenv-{{ venv_version }}.tar.gz#md5=44e19f4134906fe2d75124427dc9b716"
venv_sw: "{{ venv_home }}/sw"

# Supervisor
supervisor_home: "{{ venv_home }}"
supervisor_bin: "{{ supervisor_home }}/bin"
supervisor_etc: "{{ supervisor_home }}/etc/supervisord"
supervisor_var: "{{ supervisor_home }}/var"
supervisor_programs: "{{ supervisor_etc }}/conf.d"
```

## tomcat

```yaml
tomcat_home: "{{ ansible_env.HOME }}/tomcat"
tomcat_base: "{{ ansible_env.HOME }}/tomcat_instances"

tomcat_version: '8.0.42'
tomcat_major_version: "{{ tomcat_version[:1] }}"
tomcat_filename_unarchive: "apache-tomcat-{{ tomcat_version }}"
tomcat_filename: "{{ tomcat_filename_unarchive }}.tar.gz"
tomcat_mirror: http://archive.apache.org/dist/tomcat
tomcat_download_url: "{{ tomcat_mirror }}/tomcat-{{ tomcat_major_version }}/v{{ tomcat_version }}/bin/{{ tomcat_filename }}"
tomcat_to_be_removed: "['KEYS','LICENSE','NOTICE','RELEASE-NOTES','RELEASE-NOTES.html','RUNNING.txt','temp']"
```