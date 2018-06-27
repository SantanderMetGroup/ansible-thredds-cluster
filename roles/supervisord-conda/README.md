# Role supervisord-conda

The purpose of this role is to deploy a python virtualenv in top of the miniconda installed by the role ansible-miniconda-role. The ansible-miniconda-role is installed in order to install libnetcdf for the tds instances to use it in their ncss service.

## Role dependencies

ansible-miniconda-role

## Role usage

This role enforces you to use the following variables in your playbook:

- `miniconda_python` - Set it to `2` or `3`
- `miniconda_prefix` - Path where miniconda will be deployed, e.g. `"{{ ansible_env.HOME }}/miniconda2"`
- `miniconda_env.name` - Name of the virtualenv created inside miniconda
- `miniconda_env.dependencies` - Libs to install in the virtualenv

## Variables

- `venv_home`: `"{{ miniconda_prefix }}/envs/{{ miniconda_env.name }}"`
- `supervisord_etc`: `"{{ venv_home }}/etc"`
- `supervisord_var`: `"{{ venv_home }}/var"`
- `supervisord_programs`: `"{{ supervisord_etc }}/supervisord.d"`
- `supervisord_port`: `9001`
- `tmp_dir`: `"/tmp"`

## Documentation

The tasks in main.yml are duplicated from the role supervisord-virtualenv. Maybe this need a better design.
