# Role virtualenv-conda

The purpose of this role is to deploy a python virtualenv in top of the miniconda installed by the role ansible-miniconda-role. The ansible-miniconda-role is installed in order to install libnetcdf for the tds instances to use it in their ncss service.

## Role dependencies

ansible-miniconda-role

## Role usage

This role enforces you to use the following variables in your playbook (variables required from the role `ansible-miniconda-role`):

- `miniconda_python` - Set it to `2` or `3`
- `miniconda_prefix` - Path where miniconda will be deployed, e.g. `"{{ ansible_env.HOME }}/miniconda2"`
- `miniconda_env.name` - Name of the virtualenv created inside miniconda
- `miniconda_env.dependencies` - Libs to install in the virtualenv

## Variables

- `venv_home`: `"{{ miniconda_prefix }}/envs/{{ miniconda_env.name }}"`

## Documentation

