# Role tomcat

This role performs the deployment of a tomcat server by downloading files from the Internet and following a configuration that does not require the user to have roor privileges.

## Role dependencies

The role does not include any dependency in it's `meta/` directory but it is supposed to be used on top of the `supervisord-conda` role.

## Variables

- `jre_version`: `'8u141'`
- `jre_filename_unarchive`: `"jre-{{ jre_version }}-linux-x64"`
- `jre_filename`: `"{{ jre_filename_unarchive }}.tar.gz"`
- `jre_mirror`: `http://download.oracle.com/otn-pub/java/jdk/`
- `jre_download_url`: `"http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jre-8u172-linux-x64.tar.gz"`
- `jre_header`: `"Cookie: oraclelicense=accept-securebackup-cookie"`
- `jre_install_base`: `"{{ tomcat_home }}/jre"`
 
- `tomcat_home`: `"{{ ansible_env.HOME }}/tomcat-home"`
- `tomcat_base`: `"{{ ansible_env.HOME }}/tomcat-base"`
- `tomcat_version`: `'8.0.42'`
- `tomcat_version_major`: `"{{ tomcat_version|truncate(1, True, '', 0) }}"`
- `tomcat_filename_unarchive`: `"apache-tomcat-{{ tomcat_version }}"`
- `tomcat_filename`: `"{{ tomcat_filename_unarchive }}.tar.gz"`
- `tomcat_mirror`: `http://archive.apache.org/dist/tomcat`
- `tomcat_download_url`: `"{{ tomcat_mirror }}/tomcat-{{ tomcat_version_major }}/v{{ tomcat_version }}/bin/{{ tomcat_filename }}"`
- `tomcat_to_be_removed`: `"['KEYS','LICENSE','NOTICE','RELEASE-NOTES','RELEASE-NOTES.html','RUNNING.txt','temp']"`

## Documentation
