#!/bin/bash
# SSH to the host machine of HDFS Slaves without password(Added the key)
#Start the HDFS Slaves
echo "Starting hdfsSlaves 1, 2 and 3"
sleep 2s
ssh groupbslave1@groupb12 "virsh start hdfsSlave1; virsh start hdfsSlave2; virsh start hdfsSlave3; sleep 10s; exit"

echo "Starting hdfsSlaves 4 and 5"
sleep 2s
ssh groupb@groupb22 "virsh start hdfsSlave4; virsh start hdfsSlave5; sleep 10s; exit"

echo "Starting hdfsSlaves 6 and 7"
sleep 2s
ssh groupb@groupb23 "virsh start hdfsSlave6; virsh start hdfsSlave7; sleep 10; exit"

#Start the Virtual machine
# SSH to the host machine of HDFS Master without password(Added the key)
#Start the HDFS Master VM
echo "Starting hdfsMaster"
sleep 2s
ssh groupb@groupb13 "virsh start hdfsMaster; sleep 5s; ssh hduser@hdfsMaster \"/usr/local/hadoop/sbin/start-dfs.sh; /usr/local/hadoop/sbin/start-yarn.sh; sleep 10s; /usr/local/hadoop/bin/hdfs dfsadmin -report; exit;\"; exit"
