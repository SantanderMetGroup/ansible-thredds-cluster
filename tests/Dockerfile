FROM ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:ansible' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

## Vagrant insecure key
RUN mkdir /root/.ssh && touch /root/.ssh/authorized_keys
COPY ./ssh/insecure_private_key /tmp/
RUN ssh-keygen -y -f /tmp/insecure_private_key >> /root/.ssh/authorized_keys
RUN chmod -R 600 /root/.ssh

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
