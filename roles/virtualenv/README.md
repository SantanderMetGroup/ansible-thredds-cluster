# Role virtualenv

The purpose of this role is to deploy a python virtualenv.

## Role dependencies

None.

## Role usage

## Variables

- `venv_home`: `"{{ ansible_env.HOME }}"` - Path where the virtualenv will be created.
- `venv_version`: `15.1.0`
- `venv_file_name`: `"virtualenv-{{ venv_version }}.tar.gz"`
- `venv_file_url`: `"https://pypi.python.org/packages/d4/0c/9840c08189e030873387a73b90ada981885010dd9aea134d6de30cd24cb8/virtualenv-{{ venv_version }}.tar.gz#md5=44e19f4134906fe2d75124427dc9b716"`
- `venv_sw`: `"{{ venv_home }}/sw"`
- `tmp_dir`: `"/tmp"`

## Documentation