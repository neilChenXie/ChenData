# Setup

## Must

setup **hadoop** user
> 1. `useradd -m hadoop -s /bin/bash`
2. `passwd hadoop`

give `hadoop` all permission
> `visudo`, and `hadoop{tab}ALL=(ALL){tab}ALL`

## With Internet

connect to internet, change **hostname**
> `nmtui`

check ip
> 1. `yum install net-tools`
2. `ifconfig`

revise **hostname**(centos7) file, **/etc/sysconfig/network**(centos6)
> `{node_name}`

## EMV List

* java
    * JAVA_HOME
    * PATH
* hadoop
    * HADOOP_HOME
    * PATH

## Shell

`ssh $user@$host "$command $arg0 $arg2"` break bash execution

> `ssh -n $user@$host "$command $arg1 $arg2"`
-n prevent read from stdin
