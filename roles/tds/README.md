# Role tds

This role deploys a tds instance inside the tomcat server deployed by the 'tomcat' role.

## Role dependencies

- tomcat

## Variables

```yaml
collections: []
datasets: []

# default instance
tds:
  - name: instance
    tds_debug:
      jpda_address: "{{ ansible_nodename }}:8000"
    shutdown: 8005
    connectors:
      - type: HTTP/1.1
        port: 8080
        connectionTimeout: 20000
      - type: AJP/1.3
        port: 8009
		
tds_version: 4.6.11
tds_major_version: "{{ tds_version.split('.')[0] if not tds_version.startswith('ESGF') else '5' }}"
tds_filename_unarchive: "tds-{{ tds_version }}"
tds_filename: "{{ tds_filename_unarchive }}.war"
tds_mirror: http://artifacts.unidata.ucar.edu/content/repositories/unidata-releases/edu/ucar/tds/
tds_download_url: "{{ tds_mirror }}/{{ tds_version }}/tds-{{ tds_version }}.war"
tds_downloads_tmp: "{{ downloads_tmp | default([playbook_dir,'downloads']|join('/')) }}"
```

## Documentation

TDS is downloaded from [Unidata Nexus repository](https://artifacts.unidata.ucar.edu/).

### TdsClusterAuthorizer

TdsClusterAuthorizer is a custom Authorizer that always perform authentication in the THREDDS server using https, even when the initial request for a dataset is made in plane http.
