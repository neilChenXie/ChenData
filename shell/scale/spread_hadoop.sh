#!/bin/bash

hadoop_user=hadoop

#########Functions##########
function send_hadoop {
tar -zcf ~/hadoop.master.tar.gz $HADOOP_HOME

while read -r line
do
	ipInfo=($line)
	if [ ${ipInfo[1]}!="master" ];
	then
		scp ~/hadoop.master.tar.gz hadoop@${ipInfo[1]}:~
		ssh root@${ipInfo[1]} "tar -zxf /home/$hadoop_user/hadoop.master.tar.gz -C /usr/local/"
		ssh root@${ipInfo[1]} "chown -R $hadoop_user:$hadoop_user /usr/local/hadoop"
	fi
done < "/etc/hosts"
}

############main###########
read -r -p "Did you change $HADOOP_HOME/etc/hadoop/slaves file?[y/N]" ans

if [[ $ans == "y"  ||  $ans == "Y" ]];
then
	send_hadoop
	exit 0
else
	echo "stopped"
	exit 0
fi

