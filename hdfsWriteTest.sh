#!/bin/bash
#create sample file for testing
dd if=/dev/zero of=zerofile bs=4M count=25 conv=fdatasync

#start recording write time
startWrite=$(date -u +"%s")
hdfs dfs -put zerofile /hdfsWriteTest
#stop recording write time
stopWrite=$(date -u +"%s")
#output the write time
echo "$(($stopWrite-$startWrite)) seconds"

