#!/bin/bash

java_file=/home/`whoami`/jdk.tar.gz
hadoop_file=/home/`whoami`/hadoop.tar.gz

#ssh
ssh-keygen -t rsa

cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

sudo chmod 600 ~/.ssh/authorized_keys

sudo chown `whoami`:`whoami` /etc/hosts

ifconfig

echo "master ip:"
read masterIp

echo "$masterIp master" >> /etc/hosts

#JAVA
if [ -z $JAVA_HOME ];
then
	tar -zxf $java_file -C /home/`whoami`/
	echo "export JAVA_HOME=/home/`whoami`/jdk1.8.0_92" >> ~/.bashrc
	echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
fi

#HADOOP
if [ -z $HADOOP_HOME ];
then
	tar -zxf $hadoop_file -C /home/`whoami`/
	echo "export HADOOP_HOME=/home/`whoami`/hadoop" >> ~/.bashrc
	echo 'export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin' >> ~/.bashrc
fi
