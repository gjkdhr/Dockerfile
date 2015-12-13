FROM gjkdhr/ubuntu:sshd 

MAINTAINER gjkdhr gjkdhr@163.com

#Set environment variables, all the operations are non-interactive
ENV DEBIAN_FRONTEND noninteractive

#set the timezone
RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

#install related software.
RUN apt-get install wget pwgen ca-certificates -y
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

#install tomcat 
RUN mkdir -pv /usr/local/java/
ADD ./jdk-8u65-linux-x64.tar.gz /usr/local/java/
RUN ln -sv /usr/local/java/jdk1.8.0_65 /usr/local/java/jdk

ADD ./apache-tomcat-9.0.0.M1.tar.gz /usr/local/
RUN ln -sv /usr/local/apache-tomcat-9.0.0.M1 /usr/local/tomcat

#set tomcat variables
ENV CATALINA_HOME /usr/local/tomcat
ENV JAVA_HOME /usr/local/java/jdk

#add the startup scripts
COPY create_tomcat_admin_user.sh /create_tomcat_admin_user.sh
COPY start.sh /start.sh
RUN chmod +x /*.sh
RUN chmod +x /usr/local/tomcat/bin/*.sh

EXPOSE 8080
CMD ["/start.sh"]



