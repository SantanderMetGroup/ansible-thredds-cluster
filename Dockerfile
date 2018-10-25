FROM williamyeh/ansible:debian9

RUN apt-get update && apt-get install -y rsync

COPY ./tests /root
COPY ./roles /root/roles
COPY ./utils /root/ansible/utils

RUN mv /root/ssh /root/.ssh && chmod 700 /root/.ssh

COPY ./tests/ssh/insecure_private_key /root/.ssh/insecure_private_key

RUN chmod 600 /root/.ssh/insecure_private_key

WORKDIR /root/ansible
