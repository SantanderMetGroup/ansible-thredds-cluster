# Role supervisord-conda

The purpose of this role is to deploy a python virtualenv in top of the miniconda installed by the role ansible-miniconda-role. The ansible-miniconda-role is installed in order to install libnetcdf for the tds instances to use it in their ncss service.

## Role dependencies

ansible-miniconda-role

## Variables

- `venv_home`: `"{{ miniconda_prefix }}"`
- `supervisord_etc`: `"{{ venv_home }}/etc"`
- `supervisord_var`: `"{{ venv_home }}/var"`
- `supervisord_programs`: `"{{ supervisord_etc }}/supervisord.d"`
- `supervisord_port`: `9001`
- `tmp_dir`: `"/tmp"`

## Documentation

The tasks in main.yml are duplicated from the role supervisord-virtualenv. Maybe this need a better design.
