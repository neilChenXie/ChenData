#!/bin/bash

ssh-keygen -t rsa

cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

sudo chmod 600 ~/.ssh/authorized_keys

sudo chown `whoami`:`whoami` /etc/hosts

ifconfig

echo "master ip:"
read masterIp

echo "$masterIp master" >> /etc/hosts
