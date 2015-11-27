这是一个ssh服务的Dockefile文件，利用Dockerfile文件，
可以快速创建出sshd的image，切换到该目录下。执行
docker build --tag="gjkdhr:sshd" .
--tag用于指定利用Dockerfile生成的镜像的标签名。

当创建好镜像后，会出现
Successfully built container_id 说明创建成功。


当创建后镜像后，就可以以该镜像来启动一个容器。
docker run -d -t -i --name container_name -P sshd_images 
docker run -d -t -i --name container_name -p des_port:22 sshd_images 
来用镜像来启动一个容器。
-P 用来表示系统随机分配一个端口来映射到sshd服务的22端口。
-p 用来指定系统的一个为占用的端口影射到sshd服务的22端口。


利用docker ps -a 来查看所有启动的镜像。看启动镜像是否成功。
也可以查看该镜像将本地的那个端口影射到容器的22端口。

在start.sh文件中配置了root用户的密码admin，
还创建了新用户gjkdhr和密码gjkdhr;

测试，如果容器启动成功。
就可以远程连接该镜像了
在宿主机和远程主机上利用
ssh root@宿主机 -p 端口
ssh root@宿主机 -p 端口

在本地的宿主机上也可以通过容器中分配的ip地址进行连接。方便后续管理。
通过docker inspect --format '{{.NetworkSettings.IPAddress}}' docker_container_id来获取容器内的ip地址。 
本地宿主机连接ssh user@container_ip

注意：在启动的时候 容器后面千万不要再加一个/bin/bash ,例如这样。
docker run -d -t -i --name container_name -P sshd_images /bin/bash
这样的话，容器在启动以后，又会立即断开。会出现下面的错误。
暂时还不了解这是什么情况，后面再说吧。
[root@test1 Docker_sshd]# docker run -t -i gjkdhr:sshd /bin/bash
Extra argument /bin/bash.


