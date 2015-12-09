FROM ubuntu:14.04
MAINTAINER gjkdhr gjkdhr@163.com

#install the nginx server
RUN apt-get install nginx -y
RUN rm -rf /var/lib/apt/lists/*

#Set ndaemon to running the nginx server
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

#the directory /var/lib/nginx store the swap file
RUN chown -R www-data:www-data /var/lib/nginx

#setting the timezone
RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

#add the start.sh script
ADD ./start.sh /start.sh
RUN chmod +755 /start.sh

#set mount directory.
#virtualhost mount directory
#certificate mount directory.
#nginx config file mount
#nginx log file mount directory 
#VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/nginx.conf", "/var/log/nginx"]

#set the work directory
WORKDIR /etc/nginx/

#delete the www release directory
RUN rm -rf /usr/share/nginx/html
RUN mkdir -pv /app
RUN ln -sv /app /usr/share/nginx/html
RUN ln -sv /usr/share/nginx/html /app
ADD ./sample/ /app

#open the port
EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/bin/bash","/start.sh"]
