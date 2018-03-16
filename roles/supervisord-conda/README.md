# Role supervisord-conda

The purpose of this role is to deploy a python virtualenv in top of the miniconda installed by the role ansible-miniconda-role. The ansible-miniconda-role is installed in order to install libnetcdf for the tds instances to use it in their ncss service.

## Variables

### Public vars

Vars that must be considered by the user of the role.

- venv\_home: Optional. Directory of the virtualenv. Default: {{ miniconda\_prefix }}
- supervisord\_etc: Optional. Default: {{ venv\_home }}/etc
- supervisord\_var: Optional. Default: {{ venv\_home }}/var
- supervisord\_programs: Optional. Default: {{ supervisord\_etc }}/supervisord.d
- supervisord\_port: Optional. Default: 9001
- tmp\_dir: "/tmp"
