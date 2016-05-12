#!/bin/bash

echo "spreading updates"

# $1 = $hadoop_user
if [ -z $1 ];
then
	echo "hadoop_user needed"
	exit 0
fi

# spread based on /etc/hosts
while read -r line
do
	ipInfo=($line)
	if [ ${ipInfo[1]} != "master" ];
	then
		echo "send to $ipInfo"
		scp /etc/hosts $1@${ipInfo[0]}:/etc/hosts
		scp ~/.ssh/authorized_keys $1@${ipInfo[0]}:~/.ssh/authorized_keys
	fi
done < "/etc/hosts"
