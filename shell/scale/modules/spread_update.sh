#!/bin/bash

echo "spreading updates"

if [ -z $1 ];
then
	echo "hadoop_user needed"
	exit 0
fi

while read -r line
do
	ipInfo=($line)
	echo "send to $ipInfo"
	scp /etc/hosts $1@${ipInfo[0]}:/etc/hosts
	scp ~/.ssh/authorized_keys $1@${ipInfo[0]}:~/.ssh/authorized_keys
done < "/etc/hosts"
