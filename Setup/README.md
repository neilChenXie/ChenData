# Setup

## Master Setup



## New Slave Setup

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

java
>1. `scp {jdk-1.8.0.tar.gz} hadoop@{node_name}:~`
2. `tar -zxf {jdk-1.8.0.tar.gz} -C /usr/local/`
2. `export JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk` in **~/.bashrc**
3. `export PATH=$JAVA_HOME/bin:$PATH`
