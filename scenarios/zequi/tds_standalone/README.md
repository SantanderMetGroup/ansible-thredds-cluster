# Scenario of a standalone THREDDS Data Server

## Usage

1. git clone
3. git checkout devel
2. cd scenarios/zequi/tds_standalone
3. virtualenv virtualenv --no-site-packages
4. source virtualenv/bin/activate
5. pip install ansible
7. ansible-playbook standalone.yml
8. (in web browser) localhost:8080/thredds
10. edit catalogs in data/catalogs and datasets in data/datasets
11. ansible-playbook standalone.yml --tags update_catalogs (catalogs should be updated in the browser)
