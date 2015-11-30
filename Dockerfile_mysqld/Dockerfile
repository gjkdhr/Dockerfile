FROM centos:6.7
MAINTAINER gjkdhr <gjkdhr@163.com>

#update the yum source
RUN yum install wget -y
RUN mkdir -pv /mnt/yum
RUN mv /etc/yum.repos.d/* /mnt/yum 
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
RUN yum makecache
RUN yum install epel-release.noarch -y
RUN yum clean all

#install the mysql-server and monitor the server.
#pwgen === pwgen generates random, meaningless but pronounceable passwords.
#bash-completion.noarch === bash-completion is a collection of shell functions 
#that take advantage of the programmable completion feature of bash.
#psmisc === install fuser,killall and pstree command.
#net-tools === the net-tools container some base network manager commands.
#   including ifconfig, netstat, route, and others.
RUN yum install mysql mysql-server pwgen supervisor.noarch  bash-completion.noarch  psmisc net-tools -y
RUN yum clean all


#add the startup scripts and the mysql-server config file.
ADD ./start.sh /start.sh
ADD ./config_mysql.sh /config_mysql.sh
ADD ./supervisord.conf /etc/supervisord.conf

#config the shell script exectuion.
RUN chmod +x /start.sh
RUN chmod +x /config_mysql.sh 
RUN ./config_mysql.sh


#open the server 3306
EXPOSE 3306

CMD ["/bin/bash","/start.sh"]
