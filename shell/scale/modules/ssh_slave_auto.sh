#!/bin/bash

if [ -z $1 ];
then
	echo "1st arg should hadoop_user"
fi

#for root
# change /etc/hosts
chown $1:$1 /etc/hosts
# change authorized_keys
chmod 600 ~/.ssh/authorized_keys

##copy to hadoop_user
echo "setup hadoop_user"
cp -r ~/.ssh /home/$1/
chown -R $1:$1 /home/$1/.ssh
