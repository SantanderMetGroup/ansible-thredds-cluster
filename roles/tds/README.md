# Role tds

This role deploys a tds instance inside the tomcat server deployed by the 'tomcat' role.

## Role dependencies

- tomcat

## Role usage

This role requires that you define the following variables, from the deployment model, in your playbook: `tds_instances`, `collections`, `datasets`.
    
## Variables

- `tds_version`: `'ESGF-5.0.1'`
- `tds_filename_unarchive`: `"tds-{{ tds_version }}"`
- `tds_filename`: `"{{ tds_filename_unarchive }}.war"`
- `tds_mirror`: `http://artifacts.unidata.ucar.edu/content/repositories/unidata-releases/edu/ucar/tds/`
- `tds_download_url`: `"{{ tds_mirror }}/{{ tds_version }}/tds-{{ tds_version }}.war"`
- `tds_debug`: `False`

## Documentation

TDS is downloaded from [Unidata Nexus repository](https://artifacts.unidata.ucar.edu/).

### TdsClusterAuthorizer

TdsClusterAuthorizer is a custom Authorizer that always perform authentication in the THREDDS server using https, even when the initial request for a dataset is made in plane http.
