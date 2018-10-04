FROM ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server python sudo

# packages for interactive testing
RUN apt-get install -y vim telnet less

# add apache user
RUN adduser --disabled-password --gecos "" ansible
RUN adduser ansible sudo
RUN echo 'ansible:ansible' | chpasswd

RUN mkdir /var/run/sshd
RUN echo 'root:ansible' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

## Vagrant insecure key
RUN mkdir /home/ansible/.ssh && touch /home/ansible/.ssh/authorized_keys
RUN chown -R ansible:ansible /home/ansible/.ssh
RUN chmod 700 /home/ansible/.ssh
RUN chmod 600 /home/ansible/.ssh/*
COPY ./ssh/insecure_private_key /tmp/
RUN chmod 600 /tmp/insecure_private_key
RUN ssh-keygen -y -f /tmp/insecure_private_key >> /home/ansible/.ssh/authorized_keys

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22 8080 18009
CMD ["/usr/sbin/sshd", "-D"]
