# Hadoop setup

## Master

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

hadoop
>1. download
2. `scp ~/Download/hadoop-2.7.2.tar.gz hadoop@Master:/home/hadoop`
3. `tar -zxf hadoop-2.7.2.tar.gz -C /usr/local`
4. `chown -R hadoop:hadoop ./hadoop`

## Cluster

edit `/etc/hosts`
> check `ping` all hosts
