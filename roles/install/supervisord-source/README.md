# Role supervisord

This role install supervisord in the virtualenv created by one of the roles that installs virtualenv.

## Role dependencies

None.

## Role usage

If you want the supervisord to be proctected with password, you have to declare the following variables:

- `supervisor_user`: User name
- `supervisor_password`: User password

If they are not declared, supervisord is not protected.

## Variables

- `supervisor_etc`: `"{{ venv_home }}/etc"`
- `supervisor_var`: `"{{ venv_home }}/var"`
- `supervisor_programs`: `"{{ supervisor_etc }}/supervisord.d"`
- `supervisor_port`: `9001`

## Documentation
