# Role httpd

This role deploys an httpd server, either from source or from system binaries.

## Variables

- httpd_server_root: "{{ ansible_env.HOME }}/httpd"
- httpd_document_root: "{{ httpd_server_root }}/htdocs"
- httpd_version: '2.4.25'
- httpd_port: 8000
- httpd_src: "{{ httpd_server_root }}/src"
- httpd_conf_path: "{{ httpd_server_root }}/conf"
- httpd_conf_file: "{{ httpd_conf_path }}/httpd.conf"
- httpd_version_major: "{{ httpd_version|truncate(3, False, '', 0) }}"
- httpd_mirror: https://archive.apache.org/dist/httpd/
- httpd_filename_unarchive: "httpd-{{ httpd_version }}"
- httpd_filename: "{{ httpd_filename_unarchive }}.tar.gz"
- httpd_download_url: "{{ httpd_mirror }}/{{ httpd_filename }}"
- httpd_to_be_removed: ['build','build-1','icons','man','manual','src','include']

### APR
  
- apr_version: "1.5.2"
- apr_filename_unarchive: "apr-{{ apr_version }}"
- apr_filename: "{{ apr_filename_unarchive }}.tar.gz"
- apr_mirror: http://archive.apache.org/dist/apr
- apr_download_url: "{{ apr_mirror }}/{{ apr_filename }}"
- apr_install_base: "{{ httpd_server_root }}"
- apr_version: "1.5.2"
- apr_filename_unarchive: "apr-{{ apr_version }}"
- apr_filename: "{{ apr_filename_unarchive }}.tar.gz"
- apr_mirror: http://archive.apache.org/dist/apr
- apr_download_url: "{{ apr_mirror }}/{{ apr_filename }}"
- apr_install_base: "{{ httpd_server_root }}"

### APR util

- apr_util_version: "1.5.4"
- apr_util_filename_unarchive: "apr-util-{{ apr_util_version }}"
- apr_util_filename: "{{ apr_util_filename_unarchive }}.tar.gz"
- apr_util_mirror: http://archive.apache.org/dist/apr
- apr_util_download_url: "{{ apr_util_mirror }}/{{ apr_util_filename }}"
- apr_util_install_base: "{{ httpd_server_root }}"

### PCRE

- pcre_version: "8.40"
- pcre_filename_unarchive: "pcre-{{ pcre_version }}"
- pcre_filename: "{{ pcre_filename_unarchive }}.tar.gz"
- pcre_mirror: http://ftp.cs.stanford.edu/pub/exim/pcre
- pcre_download_url: "{{ pcre_mirror }}/{{ pcre_filename }}"
- pcre_install_base: "{{ httpd_server_root }}"

## Doc

.htpasswd for /status-httpd is currently stored in {{ httpd\_document\_root }}.
