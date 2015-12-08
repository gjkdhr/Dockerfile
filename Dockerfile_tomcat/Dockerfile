FROM centos:6.7
MAINTAINER gjkdhr gjkdhr@163.com

RUN mkdir -pv /mnt/yum
RUN yum install wget -y
RUN mv /etc/yum.repos.d/* /mnt/yum/
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
RUN yum install epel-release.noarch -y

RUN yum update -y
RUN yum install tar gcc supervisor.noarch libcap-devel -y
RUN yum clean all


#install tomcat 
RUN mkdir -pv /usr/local/java/
ADD ./jdk-8u65-linux-x64.tar.gz /usr/local/java/
RUN ln -sv /usr/local/java/jdk1.8.0_65 /usr/local/java/jdk

ADD ./apache-tomcat-9.0.0.M1.tar.gz /usr/local/
RUN ln -sv /usr/local/apache-tomcat-9.0.0.M1 /usr/local/tomcat

ADD ./install_tomcat.sh /install_tomcat.sh
ADD ./start.sh /start.sh
ADD ./HelloWorld.java /root/HelloWorld.java

RUN chmod +x /start.sh
RUN chmod +x /install_tomcat.sh

RUN ./install_tomcat.sh
COPY ./supervisord.conf /etc/supervisord.conf

#open the server 8080
EXPOSE 8080

CMD ["/bin/bash", "/start.sh"]

