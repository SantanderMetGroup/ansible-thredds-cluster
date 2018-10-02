FROM williamyeh/ansible:debian9

COPY ./tests /root
COPY ./roles /root/roles

RUN mv /root/ssh /root/.ssh && chmod 700 /root/.ssh
