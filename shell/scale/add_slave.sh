#!/bin/bash

hadoop_user=`whoami`
curp=`pwd`
echo "curp: $curp"

if [ ! -e ./modules/slave_auto_ssh.sh ] || [ ! -e ./modules/update_master.sh ] || [ ! -e ./modules/spread_update.sh ];
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
ssh root@$slaveIp  'bash -s' < ./modules/slave_auto_ssh.sh "$hadoop_user"

$curp/modules/update_master.sh "$slaveIp" "$slaveName"

# spread all updates
./modules/spread_update.sh "$hadoop_user"

