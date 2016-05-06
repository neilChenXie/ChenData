#!/bin/bash

# GET NEW SLAVE INFO
## add new slave info
echo “IP for new slave:”
read slaveIp
echo "Alias for new slave:"
read slaveName


echo "
1. ssh-keygen -t rsa
2. su&cd
3. ssh-keygen -t rsa"
ssh hadoop@$slaveIp

# slave auto ssh
## add new slave to ""authorized_keys
echo "set slave authorized_keys"
cp ~/.ssh/id_rsa.pub ~/.ssh/new_authorized_keys
sudo chmod 600 ~/.ssh/new_authorized_keys
scp ~/.ssh/new_authorized_keys hadoop@$slaveIp:~/.ssh/authorized_keys
scp ~/.ssh/new_authorized_keys root@$slaveIp:~/.ssh/authorized_keys
rm ~/.ssh/new_authorized_keys

# master info update
## authorized_keys
scp hadoop@$slaveIp:~/.ssh/id_rsa.pub ~/.ssh/new_slave_rsa.pub
cat ~/.ssh/new_slave_rsa.pub > ~/.ssh/authorized_keys
## hosts
sudo echo "$slaveIp $slaveName" >> /etc/hosts
