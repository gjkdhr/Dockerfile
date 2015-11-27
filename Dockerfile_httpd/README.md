这是一个关于httpd的dockerfile。
在安装了httpd之后，我们删除了apache的默认网站发布目录/var/www/html
之后，我们在dockerfile的目录下创建了网站发布目录single目录。

在创建镜像的过程中。我们在其的根目录下面创建了app目录，
通过COPY ./single /app将本地的single目录映射到镜像根目录下的app目录。

然后在single目录中存放网站发布的页面，
如果镜像运行成功。就可以启动并访问single目录下的内容了。

创建镜像:docker build --tag="centos6:sshd" .

以该镜像创建一个容器:
docker run -d -t -i --name web_server -p 8080:80 gjkdhr/centos:httpd 
我们将宿主机的8080端口映射到容器web_server中httpd服务的80端口上来。

在浏览器中访问
http://suzhuji_ip:8080

也可以在宿主机上测试。
获取容器中的ip地址:
docker inspect -f '{{.NetworkSettings.IPAddress}}' web_server
172.17.0.145

http://172.17.0.145
如果访问到的内容是single目录下的index.html，说明成功。
