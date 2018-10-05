FROM ubuntu:16.04

# required: openssh-server python sudo
# optional: vim telnet less
RUN apt-get update && apt-get install -y openssh-server python sudo vim telnet less

# add apache user
RUN adduser --disabled-password --gecos "" ansible ; \
	adduser ansible sudo ; \
	echo 'ansible:ansible' | chpasswd

RUN mkdir /var/run/sshd ; \
	echo 'root:ansible' | chpasswd ; \
	sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

COPY insecure_private_key /tmp/

## Vagrant insecure key
RUN mkdir /home/ansible/.ssh ; \
	touch /home/ansible/.ssh/authorized_keys ; \
	chown -R ansible:ansible /home/ansible/.ssh ; \
	chmod 700 /home/ansible/.ssh ; \
	chmod 600 /home/ansible/.ssh/* ; \
	chmod 600 /tmp/insecure_private_key ; \
	ssh-keygen -y -f /tmp/insecure_private_key >> /home/ansible/.ssh/authorized_keys

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22 8080 18009
CMD ["/usr/sbin/sshd", "-D"]
