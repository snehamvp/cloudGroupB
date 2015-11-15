#!/bin/bash

# SSH to the host machine of HDFS Master without password(Added the key)
# SSH into hdfsMaster VM and stop hdfs. Then shutdown the VM.
echo "Stopping hdfsMaster"
sleep 2s
ssh groupb@groupb13 "ssh hduser@hdfsMaster \"/usr/local/hadoop/sbin/stop-yarn.sh; /usr/local/hadoop/sbin/stop-dfs.sh; jps; sleep 5s; sudo shutdown -P now\"; exit"

echo "Stopping hdfsSlaves 1, 2 and 3"
sleep 2s
ssh groupb@groupb12 "ssh hduser@hdfsSlave1 \"sudo shutdown -P now\"; ssh hduser@hdfsSlave2 \"sudo shutdown -P now\"; ssh hduser@hdfsSlave3 \"sudo shutdown -P now\"; exit"

echo "Stopping hdfsSlaves 4 and 5"
sleep 2s
ssh groupb@groupb22 "ssh hduser@hdfsSlave4 \"sudo shutdown -P now\"; ssh hduser@hdfsSlave5 \"sudo shutdown -P now\"; exit"

echo "Stopping hdfsSlaves 6 and 7"
sleep 2s
ssh groupb@groupb23 "ssh hduser@hdfsSlave6 \"sudo shutdown -P now\"; ssh hduser@hdfsSlave7 \"sudo shutdown -P now\"; exit"
