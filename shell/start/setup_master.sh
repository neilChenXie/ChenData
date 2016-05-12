#!/bin/bash

java_file=/home/`whoami`/jdk.tar.gz
hadoop_file=/home/`whoami`/hadoop.tar.gz

#ssh execute once
if [ ! -d /home/`whoami`/.ssh ]
then
	ssh-keygen -t rsa
fi

if [ ! -f /home/`whoami`/.ssh/authorized_keys ]
then
	cat /home/`whoami`/.ssh/id_rsa.pub >> /home/`whoami`/.ssh/authorized_keys
fi

sudo chmod 600 ~/.ssh/authorized_keys

sudo chown `whoami`:`whoami` /etc/hosts

read -r -p "Add Master IP to /etc/hosts? [y/N]" ans
if [[ $ans == "y" || $ans == "Y" ]]
then
	ifconfig
	echo "master ip:"
	read masterIp
	echo "$masterIp master" >> /etc/hosts
fi

#JAVA
if [ -z $JAVA_HOME ];
then
	if [ -f $java_file ];
	then
		echo "extract jdk"
		tar -zxf $java_file -C /home/`whoami`/
		echo "export JAVA_HOME=/home/`whoami`/jdk" >> ~/.bashrc
		echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
	else
		echo "$java_file not exist"
	fi
else
	echo "Java already installed"
fi

#HADOOP
if [ -z $HADOOP_HOME ];
then
	if [ -f $hadoop_file ];
	then
		echo "extract hadoop"
		tar -zxf $hadoop_file -C /home/`whoami`/
		echo "export HADOOP_HOME=/home/`whoami`/hadoop" >> ~/.bashrc
		echo 'export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin' >> ~/.bashrc
	else
		echo "$hadoop_file not exist"
	fi
else
	echo "Hadoop already installed"
fi

# Valid .bashrc changes
source /home/`whoami`/.bashrc
