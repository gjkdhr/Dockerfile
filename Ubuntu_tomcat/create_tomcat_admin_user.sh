#!/bin/bash

if [ -f /.create_admin_created ]
then
	echo "Tomcat 'admin' user already created."
	exit 0;
fi


PASSWD="tomcatadmin"
echo "========================================="
echo "Starting config tomcat passwd."
sed -i 's/<\/tomcat-users>//' ${CATALINA_HOME}/conf/tomcat-users.xml
echo "<role rolename=\"manager-gui\"/>" >> ${CATALINA_HOME}/conf/tomcat-users.xml
echo "<role rolename=\"manager-script\"/>" >> ${CATALINA_HOME}/conf/tomcat-users.xml
echo "<role rolename=\"manager-jmx\"/>" >> ${CATALINA_HOME}/conf/tomcat-users.xml
echo "<role rolename=\"admin-gui\"/>" >> ${CATALINA_HOME}/conf/tomcat-users.xml
echo "<role rolename=\"admin-script\"/>" >> ${CATALINA_HOME}/conf/tomcat-users.xml
echo -e "<user username=\"tomcat\" password=\"${PASSWD}\" roles=\"manager-gui,manager-script,manager-jmx,admin-gui,admin-script\"/>" \
>> ${CATALINA_HOME}/conf/tomcat-users.xml
echo "</tomcat-users>" >> ${CATALINA_HOME}/conf/tomcat-users.xml

touch /.create_admin_created

echo "====================================="
echo "You can configure to thix Tomcat server using:"
echo "USER:tomcat"
echo "PASSWD:tomcatadmin"
echo "====================================="
 

