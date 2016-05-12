#!/bin/bash

hadoop_user=`whoami`

if [ ! -e ./modules/ssh_slave_auto.sh ];
then
	echo "lake ./modules/* files"
fi

read -r -p "IP for new slave:" slaveIp
read -r -p "Alias for new slave:" slaveName

# slave root .ssh
ssh root@$slaveIp 'ssh-keygen -t rsa'

# slave add authorized_keys
scp ~/.ssh/id_rsa.pub root@$slaveIp:~/.ssh/authorized_keys

# slave root and hadoop_user trust master
ssh root@$slaveIp  'bash -s' < ./modules/ssh_slave_auto.sh "$hadoop_user"

#AUTOMATIC
# setup .bashrc
scp ~/.bashrc $hadoop_user@$slaveIp:~/.bashrc

#update master
bash ./modules/ssh_update_master.sh "$slaveIp" "$slaveName"

# spread all updates
bash ./modules/ssh_spread_update.sh "$hadoop_user"
