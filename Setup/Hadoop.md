# Hadoop setup

## VM ENV Setup

setup **hadoop** user
> 1. `useradd -m hadoop -s /bin/bash`
2. `passwd hadoop`

give `hadoop` all permission
> `visudo`, and `hadoop{tab}ALL=(ALL){tab}ALL`

connect to internet, change **hostname**
> `nmtui`

check ip
> 1. `yum install net-tools`
2. `ifconfig`

revise **hostname**(centos7) file, **/etc/sysconfig/network**(centos6)
> `{node_name}`

ssh keys
> Master:
1. `ssh-keygen -t rsa`
2. `cat ~/.ssh/id_rsa.pub >> authorized_keys`
3. `chmod 600 authorized_keys`

>Slave:
1. `ssh-keygen - rsa` **~/.ssh/** folder need to be create by **ssh-keygen**
1. `scp hadoop@Master:~/.ssh/id_rsa.pub ~/master_rsa.pub`
2. `cat ~/master_rsa.pub >> ~/.ssh/authorized_keys`
3. `chmod 600 ~/.ssh/authorized_keys`

java
>1. `scp {jdk-1.8.0.tar.gz} hadoop@{node_name}:~`
2. `tar -zxf {jdk-1.8.0.tar.gz} -C /usr/local/`
2. `export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk` in **~/.bashrc**
3. `export PATH=$JAVA_HOME/bin:$PATH`


## Hadoop Setup

hadoop
>1. download
2. `scp ~/Download/hadoop-2.7.2.tar.gz hadoop@Master:/home/hadoop`
3. `tar -zxf hadoop-2.7.2.tar.gz -C /usr/local`
4. `chown -R hadoop:hadoop ./hadoop`
### Settings:

files under $HADOOP_HOME/etc/hadoop/

**slaves**:
> domain name of DataNodes

**core-site.xml**:
> NameNode setting, Core setting

| name | value | comment |
| ---- | ----- | ------- |
| fs.defaultFS | hdfs://Master:9000 | NameNode URL&Port |
| hadoop.tmp.dir | file:/usr/local/hadoop/tmp | NameNode tmp files |

**hdfs-site.xml***:
> hdfs related setting

| name | value | comment |
| ---- | ---- | ------ |
| dfs.namenode.secondary.http.address | Master:50090 | Secondary NameNode URL&Port|
| dfs.replication | 1 | How many copies |
| dfs.namenode.name.dir | file:/usr/local/hadoop/tmp/dfs/name | namenode file |
| dfs.datanode.data.dir | file:/usr/local/hadoop/tmp/dfs/data | datanode file |

**mapred-site.xml**:
> mapreduce related setting

| name | value | comment |
| ---- | ----- | ------ |
| mapreduce.framework.name | yarn | mapreduce engine |
| mapreduce.jobhisttory.address | Master:10020 | job history server|
| mapreduce.jobhisttory.webapp.address | Master:19888 | job history server |

**yarn-site.xml**:
> yarn related setting

| name | value | coment |
| ---- | ----- | ------ |
| yarn.resourcemanager.hostname | Master | resource manager |
| yarn.nodemanager.aux-service | mapreduce_shuffle | shuffle service |

## Scale Up Cluster

under **Master**

1. edit **Master's** `/etc/hosts`, send to **all previous Slaves**
> check `ping` all hosts

2. Auto ssh
> `scp ~/.ssh/id_rsa.pub hadoop@Slave{n}:~/master_rsa.pub`,

3. add **new ip** to /usr/local/hadoop/etc/hadoop/slaves

4. copy hadoop
> `tar -zcf ~/hadoop.master.tar.gz ./hadoop` & `scp ~/hadoop.master.tar.gz hadoop@{new ip}:~`

Under **new slave**:

1. put under **/usr/local/hadoop**
> `sudo tar -zxf hadoop.master.tar.gz -C /usr/local/`
2. under .bashrc:
> `export PATH=$PATH:/usr/local/hadoop/bin:/usr/local/hadoop/sbin`

3. stop firewall
> `sudo service iptables stop #centos6`
`systemctl stop firewalld.service #centos7`
