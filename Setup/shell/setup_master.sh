#!/bin/bash

# GET MASTER INFO
## add new slave info
echo “IP for master:”
read masterIp
## add to /etc/hosts ROOT
sudo echo "$slaveIp Master" >> /etc/hosts

if [ ! -d "/home/`whoami`/.ssh" ]; then
    ssh-keygen -t rsa
    touch ~/.ssh/authorized_keys
    sudo chmod 600 ~/.ssh/authorized_keys
fi

echo "check with ssh"
