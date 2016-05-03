# Hadoop setup

## VM Setup

setup **hadoop** user
> `useradd -m hadoop -s /bin/bash`

give `hadoop` all permission
> `visudo`, and `hadoop{tab}ALL=(ALL){tab}ALL`

connect to internet, change **hostname**
> `nmtui`

revise **hosts** file
> `{ip} Master`

ssh keys
> 1. `ssh-keygen -t rsa`
2. `cat ~/.ssh/id_rsa.pub >> authorized_keys`
3. `chmod 600 authorized_keys`

java
>1. `sudo yum install java-1.7.0-openjdk java-1.7.0-openjdk-devel`
2. `export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk` in **~/.bashrc**


## Hadoop

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

1. Copy hadoop.master.tar.gz to new VM

2. edit **Master's** `/etc/hosts`
> check `ping` all hosts

3. add **new slave** to `/etc/hadoop/slaves`
