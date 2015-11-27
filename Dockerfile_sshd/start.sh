#!/bin/bash

create_user(){
	#create a user into ssh
	useradd gjkdhr
	USER="gjkdhr"
	USER_PASSWORD="gjkdhr"
	#add user password
	echo "root:admin"|chpasswd
	echo $USER:$USER_PASSWORD|chpasswd

}

create_user
