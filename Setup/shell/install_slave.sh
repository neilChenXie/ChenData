#!/bin/bash

# add new slave info
echo “IP for new slave:”
read slaveIp
echo "Alias for new slave:"
read slaveName

# add to /etc/hosts ROOT
echo "$slaveIp $slaveName" >> /etc/hosts

# add to /usr/local/hadoop/etc/hadoop/slaves HADOOP
echo "$slaveName" >> /usr/local/hadoop/etc/hadoop/slaves

# prerequsite: operate by hand
# scp /home/`whoami`/.ssh/id_rsa.pub
