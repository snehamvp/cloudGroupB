#!/bin/bash
#create empty directory to push to HDFS
mkdir testAccessControl

#push empty directory to HDFS
hdfs dfs -put testAccessControl /testAccessControl

#start recording Access read time
startAccessRead=$(date -u +"%s")

hdfs dfs -getfacl -R /testAccessControl

#stop recording Access read time
stopAccessRead=$(date -u +"%s")

#output the Access read time
echo "Access Read time :: $(($stopAccessRead-$startAccessRead)) seconds"
echo "Access Read time, $(($stopAccessRead-$startAccessRead))" >> hdfsParamOutput.xls

#remove test data
rm -r -f testAccessControl
hdfs dfs -rm -R /testAccessControl
