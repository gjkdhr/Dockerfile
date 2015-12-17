FROM centos:latest
MAINTAINER gjkdhr gjkdhr@163.com

#update the system.
RUN yum update -y
RUN yum clean all

#install the openssh-server
RUN yum install openssh-server openssh-clients passwd -y
RUN yum clean all

#-N phrase   Provide new passphrase.
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ed25519_key -N ''
RUN mkdir -pv /var/run/sshd

COPY ./start.sh /start.sh
RUN chmod +x /start.sh
RUN ./start.sh
EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd","-D"]
