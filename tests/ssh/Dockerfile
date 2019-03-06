FROM centos:7

RUN yum groupinstall -y "Development Tools" && \
    yum install -y epel-release && \
    yum install -y openssh-server python sudo python-passlib rsync net-tools unzip \
	vim telnet

RUN adduser ansible -G wheel ; \
	echo 'ansible:ansible' | chpasswd ; \
	echo '%wheel         ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers

RUN mkdir /var/run/sshd ; \
	echo 'root:ansible' | chpasswd ; \
	sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

COPY insecure_private_key /tmp/

## insecure key
RUN mkdir /home/ansible/.ssh ; \
	touch /home/ansible/.ssh/authorized_keys ; \
	chown -R ansible:ansible /home/ansible/.ssh ; \
	chmod 700 /home/ansible/.ssh ; \
	chmod 600 /home/ansible/.ssh/* ; \
	chmod 600 /tmp/insecure_private_key ; \
	ssh-keygen -y -f /tmp/insecure_private_key >> /home/ansible/.ssh/authorized_keys

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN ssh-keygen -A

EXPOSE 22 8080 18009
CMD ["/usr/sbin/sshd", "-D"]
