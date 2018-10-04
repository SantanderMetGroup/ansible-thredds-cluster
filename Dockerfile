FROM williamyeh/ansible:debian9

RUN apt-get update && apt-get install -y rsync

COPY ./tests /root
COPY ./roles /root/roles
COPY ./utils /root/ansible/utils

RUN mv /root/ssh /root/.ssh && chmod -R 600 /root/.ssh

WORKDIR /root/ansible
