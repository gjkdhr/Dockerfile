FROM centos:centos6
MAINTAINER gjkdhr gjkdhr@163.com

RUN mkdir -pv /mnt/yum
RUN yum install wget -y
RUN mv /etc/yum.repos.d/* /mnt/yum/
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
RUN yum clean all
RUN yum makecache

RUN yum update -y
RUN yum install openssh-server openssh openssh-clients -y

#config the sshd,make the pam noattive;
RUN sed -i '97s/^/#/g' /etc/ssh/sshd_config
RUN sed -i '96s/^#//g' /etc/ssh/sshd_config

#config the sshd start error;
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key

ADD ./start.sh /start.sh
RUN chmod 755  ./start.sh
RUN mkdir -pv /var/run/sshd
RUN echo "root:gjkdhr"|chpasswd

#EXPOSE 22
RUN ./start.sh
ENTRYPOINT ["/usr/sbin/sshd", "-D"]


