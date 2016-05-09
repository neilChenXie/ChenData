#!/bin/bash

# read one colume of file
ipList=$( cat /etc/hosts | awk '{print $1}' )
echo $ipList

for ip in $ipList ;
do
    echo $ip
done

# folder exist
if [ ! -d "/home/`whoami`/.ssh" ]; then
    ssh-keygen -t rsa
fi
