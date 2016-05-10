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

while read -r ip_list
    updateHost $ip_list
    updateSSH $ip_list
do
done < "/etc/hosts"
