# Role supervisord-virtualenv

The purpose of this role is to deploy a python virtualenv.

## Variables

### Public vars

venv_home: Optional. Default: {{ ansible\_env.HOME }}
venv\_version: Optional. Default: 15.1.0
venv\_file\_name:  Optional. Default: virtualenv-{{ venv\_version }}.tar.gz
venv\_file\_url:  Optional. Default: https://pypi.python.org/packages/d4/0c/9840c08189e030873387a73b90ada981885010dd9aea134d6de30cd24cb8/virtualenv-{{ venv\_version }}.tar.gz#md5=44e19f4134906fe2d75124427dc9b716
venv\_sw: Optional. Default: {{ venv\_home }}/sw
supervisord\_etc: Optional. Default: {{ venv\_home }}/etc
supervisord\_var: Optional. Default: {{ venv\_home }}/var
supervisord\_programs: Optional. Default: {{ supervisord\_etc }}/supervisord.d
supervisord\_port: Optional. Default: 9001
tmp\_dir: Optional. Default: /tmp
