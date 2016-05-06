# get slave list
while read -r ip_list
    updateHost $ip_list
    updateSSH $ip_list
do
done < "/etc/hosts"

function updateHost {
    scp /etc/hosts root@$1:/etc/hosts
}

function updateSSH {
    scp /home/hadoop/.ssh/authorized_keys hadoop@$1:/home/hadoop/.ssh/authorized_keys
}
