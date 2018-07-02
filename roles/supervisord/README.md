# Role supervisord

This role install supervisord in the virtualenv created by one of the roles that installs virtualenv.

## Role dependencies

None.

## Role usage

If you want the supervisord to be proctected with password, you have to declare the following variables:

- `supervisord_user`: User name
- `supervisord_password`: User password

If they are not declared, supervisord is not protected.

## Variables

- `supervisord_etc`: `"{{ venv_home }}/etc"`
- `supervisord_var`: `"{{ venv_home }}/var"`
- `supervisord_programs`: `"{{ supervisord_etc }}/supervisord.d"`
- `supervisord_port`: `9001`

## Documentation
