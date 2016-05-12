#!/bin/bash

java_file=/home/$hadoop_user/jdk.tar.gz
hadoop_user=`whoami`

#input
echo "slave name"
read slaveName

#setup java
scp $java_file $hadoop_user@$slaveName:~/$java_file
ssh $hadoop_usre@$slaveName "tar -zxf /home/$hadoop_user/$java_file -C ~/jdk"
