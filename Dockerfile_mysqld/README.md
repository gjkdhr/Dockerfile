这是docker关于mysql的镜像。
里面添加配置了supervisor的服务，在里面添加mysqld的后台进程管理/

mysql的安装就很简单，
在通过dockerfile文件build images的时候，切换到dockerfile目录下
里面的config_mysql.sh 脚本，用来创建不同用户访问mysql-server时的密码。
如果在登陆的时候不知道密码，可通过查看该文件，将授权密码告诉给授权主机。
docker build --tag="gjkdhr/centos:mysqld" .

通过images创建一个container，并运行。
在dockerfile中，最后一行CMD命令，默认会在创建容器的时候，运行start.sh脚本
该脚本也很简单，在最后一行来启动supervisord服务的进程。
docker run -d -t -i --name mysqld -P gjkdhr/centos:mysqld 

如果本地用户需要登录的话，需要先获取container 的ip地址。
docker inspect --format '{{.NetworkSettings.IPAddress}}' mysqld/container_id
或者
docker inspect mysqld/container_id|grep -i ipaddress

有时候我们需要访问数据库里的所有库，有时候只需要访问被创建的库，如testdb，
可根据实际情况进行授权。
当container成功启动后，
本地用户启动；
mysql -uroot -predhat -e "GRANT ALL PRIVILEGES ON testdb.* TO 'testdb'@'%' IDENTIFIED BY 'testdbadmin'; FLUSH PRIVILEGES;"
mysql -u testdb  -h 172.17.0.X  -ptestdbadmin
172.17.0.x是该容器的ip地址。
上面的授权是关于localhost的,只能对testdb数据库进行操作。
在其他远程机上登录
mysql -u testdb -h 10.100.62.120 -P 32768 -p


mysql -uroot -predhat -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'dbadmin';FLUSH PRIVILEGES;"
主机登录
mysql -u root -h 172.17.0.X -pdbadmin

其他主机可以连接到的。
在创建container的时候，系统会自动分配端口映射到container里面的3306端口。
这样其他主机可以通过该主机的ip地址+端口来访问container里面的mysqld服务器。
mysql -h 10.100.62.120 -P 32772 -u root -pdbadmin
-P用来指定端口，该端口在运行的container中
[root@test1 ~]# docker ps -a
CONTAINER ID        IMAGE                  COMMAND                CREATED             STATUS                    PORTS                     NAMES
1baee4259ab1        gjkdhr/centos:mysqld   "/bin/bash /start.sh   20 hours ago        Up 20 hours               0.0.0.0:32772->3306/tcp   mysqld




