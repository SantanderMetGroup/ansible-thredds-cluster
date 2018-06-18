# Role tds

This role deploys a tds instance inside the tomcat server deployed by the 'tomcat' role.

## Variables

### Public vars

Vars that must be considered by the user of the role:

- `tds_version`: 4.6.11
- `tds_mirror`: `http://artifacts.unidata.ucar.edu/content/repositories/unidata-releases/edu/ucar/tds/`
- `tds_download_url`: `{{ tds_mirror }}/{{ tds_version }}/tds-{{ tds_version }}.war`
- `tds_debug`: `False`. If `True`, tds instances are started as `catalina.sh jpda start`

Vars for **tds_instances**:

- `name`: Identifier for the instance, also used in the path to the instance (appended to `tomcat_base`)
- `shutdown`: Port for tomcat shutdown
- `tds_content_root`: Path to the content root of the TDS instance. Default is `$CATALINA_BASE/content`
- `java_opts`: JVM params
  - `normal`: e.g. `-d64 -Xmx4096m -Xms512m -server -ea`
  - `head_dump`: e.g. `-XX:+HeapDumpOnOutOfMemoryError`
  - `headless`: e.g. `-Djava.awt.headless=true`
- `connectors`: Connectors for tomcat
  - `type`: (http|ajp)
  - `port`: Port number for the connector
  - `proxyName`: proxyName attribute for the connector
  - `connectionTimeout`: connectionTimeout attribute for the connector
- `replicas`: Collections that are supported by the instance
  - `name`: Must reference the `path` attribute of the collection
  
Vars for **collections**:

- `path`: Identifier of the collection and name of the path under `content/thredds`
- `top`: If True, a link will be added to the static catalog.html in the reverse proxy
- `catalogs`:
  - `src`: Local path to the catalogs directory
  
Vars for **datasets**:

- `src`: Local path to the datasets directory
- `dest`: Absolute remote path where datasets will be copied. If empty, datasets are copied to `content/thredds/public`

### Private vars

Vars only interesting for developers of the role.

- `tds_filename_unarchive`: `tds-{{ tds_version }}`
- `tds_filename`: `{{ tds_filename_unarchive }}.war`

## Doc

TDS is downloaded from [Unidata Nexus repository](https://artifacts.unidata.ucar.edu/).
