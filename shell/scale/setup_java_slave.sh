#!/bin/bash

hadoop_user=`whoami`
java_file=/home/$hadoop_user/jdk.tar.gz

#input
read -r -p "slave name:" slaveName

if [ ! -z $slaveName ]
then
	#setup java
	scp $java_file $hadoop_user@$slaveName:~
	ssh $hadoop_user@$slaveName "tar -zxf $java_file -C /home/$hadoop_user/"
fi
