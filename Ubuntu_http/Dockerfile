FROM gjkdhr/ubuntu:sshd
MAINTAINER gjkdhr gjkdhr@163.com

#Set environment variable,all operations are Non interactive mode
ENV DEBIAN_FRONTEND noninteractive

#install apache server
RUN apt-get install apache2 -y

#delete the "apt-get update" store download packages
#commands like apt-cache will fail to provide information (since the cache is empty).
RUN rm -rf /var/lib/apt/lists/*

#dpkg=dibian package. tzdata=timezone data  "Reconfiguration time zone"
RUN dpkg-reconfigure -f noninteractive tzdata

#add the startup script 
ADD start.sh /start.sh
RUN chmod +755 /start.sh

#delete the default web directory.
RUN mkdir -pv /var/lock/apache2 
RUN mkdir -pv /app
RUN rm -rf /var/www/html

#add the new web_directory and links soft.
RUN ln -sv /app /var/www/html
COPY ./sample/ /app

#set apache variables. use -e options it the start of the container
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_SERVERADMIN admin@localhost
ENV APACHE_SERVERNAME localhost
ENV APACHE_SERVERALIAS docker.localhost
ENV APACHE_DOCUMENTROOT /var/www/

EXPOSE 22
EXPOSE 80
WORKDIR /app
ENTRYPOINT ["/bin/bash","/start.sh"]
