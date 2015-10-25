#!/bin/bash
# SSH to the host machine of HDFS Slaves without password(Added the key)
#Start the HDFS Slaves
ssh groupbslave1@groupb13 "virsh start hdfs_new1; virsh start hdfs_new2; virsh start hdfs_new3; exit"

#Start the Virtual machine
# SSH to the host machine of HDFS Master without password(Added the key)
#Start the HDFS Master VM
ssh groupb@groupb12 "virsh start hdfs; ssh hduser@hdfsMaster \"/usr/local/hadoop/sbin/start-dfs.sh; /usr/local/hadoop/sbin/start-yarn.sh; sleep 5s; /usr/local/hadoop/bin/hdfs dfsadmin -report; exit;\"; exit"
