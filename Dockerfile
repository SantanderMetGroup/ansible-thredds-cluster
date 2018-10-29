FROM williamyeh/ansible:debian9

RUN apt-get update && apt-get install -y rsync

COPY . /ansible-thredds-cluster

RUN chmod 600 /ansible-thredds-cluster/tests/ssh/insecure_private_key

WORKDIR /ansible-thredds-cluster/tests/ansible
