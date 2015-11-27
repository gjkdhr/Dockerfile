FROM centos:6.7
MAINTAINER gjkdhr gjkdhr@163.com

RUN mkdir -pv /mnt/yum
RUN yum install wget -y
RUN mv /etc/yum.repos.d/* /mnt/yum/
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
RUN yum clean all
RUN yum makecache

RUN yum install httpd -y
#RUN echo "This is container web test." > /var/www/html/index.html


ADD run_httpd.sh /run_httpd.sh

RUN mkdir -pv /app
COPY ./single /app
RUN rm -rf /var/www/html
RUN ln -sv /app /var/www/html
RUN chmod 755 /run_httpd.sh


EXPOSE 80
CMD ["./run_httpd.sh"]
