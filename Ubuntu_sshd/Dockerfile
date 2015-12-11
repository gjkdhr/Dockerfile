FROM ubuntu:14.04
MAINTAINER gjkdhr gjkdhr@163.com


#update the sources origin
RUN apt-get install -y wget 
RUN mv /etc/apt/sources.list /etc/apt/sources.list.backup
RUN wget -O /etc/apt/sources.list http://mirrors.163.com/.help/sources.list.trusty
RUN apt-get update -y
RUN apt-get dist-upgrade -y

#install the openssh-server
RUN apt-get install openssh-server -y
RUN mkdir -pv /var/run/sshd
RUN mkdir -pv /root/.ssh

#Cancel PAM restrictions
RUN sed -i '/pam_loginuid.so/s/^/#/' /etc/pam.d/sshd

ADD ./authorized_keys /root/.ssh/authorized_keys
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE 22

ENTRYPOINT ["/bin/bash","/start.sh"]

