#!/bin/bash

echo "update master"

if [[ -z $1  ||  -z $2 ]];
then
	echo "slaveIp and slaveName are needed"
	exit 0
else
	slaveIp=$1
	slaveName=$2
fi

# master trust new slave
scp root@$slaveIp:~/.ssh/id_rsa.pub ~/.ssh/new_auth.pub
cat ~/.ssh/new_auth.pub >> ~/.ssh/authorized_keys
rm ~/.ssh/new_auth.pub

# update /etc/hosts
echo "$slaveIp $slaveName" >> /etc/hosts
