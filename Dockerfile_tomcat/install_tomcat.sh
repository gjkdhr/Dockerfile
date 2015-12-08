#!/bin/bash

function install_openjdk(){
	rpm -qa|grep java
	if [ $? -eq 0 ]
	then 
		yum remove java-1.7.0-openjdk-1.7.0.91-2.6.2.2.el6_7.x86_64 -y
		yum remove java-1.6.0-openjdk-1.6.0.37-1.13.9.4.el6_7.x86_64 -y 
		yum remove tzdata-java-2015g-2.el6.noarch -y
	fi
	
}

function install_java(){

	#config the java envirment
cat >>  /etc/profile.d/java.sh << EOF
export JAVA_HOME=/usr/local/java/jdk/
export CLASSPATH=.:%JAVA_HOME%/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=/usr/local/java/jdk/bin/:$PATH
EOF
	export PATH=/usr/local/java/jdk/bin/:$PATH
	source /etc/profile.d/java.sh

	#test the java
	cd /root/
	/usr/local/java/jdk/bin/javac HelloWorld.java
	/usr/local/java/jdk/bin/java HelloWorld
	if [ $? -eq 0 ]
	then 
		echo "The java have installed successfully."
	else
		echo "The java have installed failed."
		exit 1
	fi	
 
}


function install_tomcat(){
	#we haved add the apache-tomcat package into the container.
	cd /usr/local/tomcat/bin/
	tar -xvf commons-daemon-native.tar.gz
	cd commons-daemon-1.0.15-native-src/unix
	./configure --with-java=/usr/local/java/jdk/
	make 
	cp jsvc /usr/local/tomcat/bin/

	#modify the java envierment path
	

	#add the user for manage the deamon service.
	useradd -M tomcat
	chown -R tomcat /usr/local/tomcat

	#add the exec binary-shell
	chmod +x /usr/local/tomcat/bin/
		
	

}

install_openjdk
install_java
install_tomcat

