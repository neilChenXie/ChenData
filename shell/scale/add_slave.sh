#!/bin/bash

hadoop_user=`whoami`

if [ ! -e ./modules/ssh_slave_auto.sh ];
then
	echo "lake ./modules/* files"
fi

echo “IP for new slave:”
read slaveIp
echo "Alias for new slave:"
read slaveName


# need slave root passwd
ssh root@$slaveIp 'ssh-keygen -t rsa'

# need slave root passwd
scp ~/.ssh/id_rsa.pub root@$slaveIp:~/.ssh/authorized_keys

# need slave root passwd
ssh root@$slaveIp  'bash -s' < ./modules/ssh_slave_auto.sh "$hadoop_user"

# setup .bashrc
scp ~/.bashrc $hadoop_user@$slaveIp:~/.bashrc

#update master
bash ./modules/ssh_update_master.sh "$slaveIp" "$slaveName"

# spread all updates
bash ./modules/ssh_spread_update.sh "$hadoop_user"
