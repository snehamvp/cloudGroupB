#!/bin/bash

# SSH to the host machine of HDFS Master without password(Added the key)
# SSH into hdfs master VM and stop hdfs
ssh groupb@groupb12 "ssh hduser@hdfsMaster \"/usr/local/hadoop/sbin/stop-yarn.sh; /usr/local/hadoop/sbin/stop-dfs.sh; jps; exit;\"; exit"
