#!/bin/bash

# GET NEW SLAVE INFO
## add new slave info
echo “IP for new slave:”
read slaveIp
echo "Alias for new slave:"
read slaveName

ssh hadoop@$slaveIp  'ssh-keygen -t rsa'
ssh root@$slaveIp 'chown hadoop:hadoop /etc/hosts'


#scp setup_ssh.sh hadoop@$slaveIp:~/
#ssh hadoop@$slaveIp ARG1="$slaveIp" 'bash -s' < setup_ssh.sh
# Master add new slave
scp hadoop@$slaveIp:~/.ssh/id_rsa.pub ~/.ssh/new_authorized_keys
cat ~/.ssh/new_authorized_keys >> ~/.ssh/authorized_keys

# /etc/hosts already belong to Hadoop user
echo "$slaveIp $slaveName" >> /etc/hosts

# Send to all slaves
ipList=$( cat /etc/hosts | awk '{print $1}' )

for ip in $ipList ;
do
    scp /etc/hosts hadoop@$ip:/etc/hosts
    scp ~/.ssh/authorized_keys hadoop@$ip:~/.ssh/authorized_keys
done
