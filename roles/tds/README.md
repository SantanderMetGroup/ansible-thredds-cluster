# Role tds

This role deploys a tds instance inside the tomcat server deployed by the 'tomcat' role.

## Role dependencies

- tomcat

## Role usage

This role requires that you define the following variables in your playbook: `tds_instances`, `collections`, `datasets`.

Every `tds_instance` corresponds to a tomcat process running in the $CATALAINA_BASE directory defined in the `tomcat` role.

    tds_instances:  
      - name: Identifier for the instance, also used in the path to the instance (appended to tomcat_base)  
        shutdown: Port for tomcat shutdown  
        tds_content_root: Path to the content root of the TDS instance. Default is $CATALINA_BASE/content  
        tds_debug:  
          jpda_address: Default is localhost:8000  
        connectors: Connectors for tomcat  
          type: (http|ajp)  
          port: Port number for the connector  
          proxyName: proxyName attribute for the connector  
          connectionTimeout: connectionTimeout attribute for the connector  
        replicas: Collections that are supported by the instance  
          name: Must reference the path attribute of the collection that this instance replicates.  

A `collection` is a tree of THREDDS catalogs. The root of the tree is a file, in xml format, whose name must be `catalog.xml`. This file follows the THREDDS xml catalog specification.

    collections:  
      - path: Identifier of the collection and path under content/thredds  
        top: If True, a link will be added to the static catalog.html in the reverse proxy  
        catalogs:  
          src: Local path to the catalogs directory  
    
The `datasets` variables allows the user of the role to copy files from the control host(in Ansible parlance), to the remote hosts. Usually, these files are datasets referenced by the catalogs.

    datasets:  
      - src: Local path to the datasets directory  
        dest: Absolute remote path where datasets will be copied. If empty, datasets are copied to content/thredds/public  
    
## Variables

- `tds_version`: `'ESGF-5.0.1'`
- `tds_filename_unarchive`: `"tds-{{ tds_version }}"`
- `tds_filename`: `"{{ tds_filename_unarchive }}.war"`
- `tds_mirror`: `http://artifacts.unidata.ucar.edu/content/repositories/unidata-releases/edu/ucar/tds/`
- `tds_download_url`: `"{{ tds_mirror }}/{{ tds_version }}/tds-{{ tds_version }}.war"`
- `tds_debug`: `False`

## Documentation

TDS is downloaded from [Unidata Nexus repository](https://artifacts.unidata.ucar.edu/).
