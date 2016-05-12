#!/bin/bash

hadoop_user=`whoami`
hadoop_file=/home/$hadoop_user/hadoop.tar.gz


if [ -d /home/$hadoop_user/hadoop ]
then
	cd /home/$hadoop_user/
	tar -zcf $hadoop_file hadoop
else
	echo "/home/$hadoop_user/hadoop not exists"
fi

while read -r line
do
	ipInfo=($line)
	if [ ${ipInfo[1]} != "master" ];
	then
		echo "send to $ipInfo"
		#setup hadoop
		scp $hadoop_file $hadoop_user@${ipInfo[1]}:/home/$hadoop_user/
		ssh -n $hadoop_user@${ipInfo[1]} "tar -zxf $hadoop_file -C /home/$hadoop_user/"
	fi
done < "/etc/hosts"
