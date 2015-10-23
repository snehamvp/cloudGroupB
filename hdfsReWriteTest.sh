#!/bin/bash
#create sample file for testing
mkdir writeTest
dd if=/dev/zero of=writeTest/zerofile bs=4M count=256 conv=fdatasync
hdfs dfs -put writeTest /hdfsWriteTest

#start recording write time
startWrite=$(date -u +"%s")
hdfs dfs -put zerofile /hdfsWriteTest
#stop recording write time
stopWrite=$(date -u +"%s")

#output the write time
echo "Re-Write time :: $(($stopWrite-$startWrite)) seconds"
rm -r -f writeTest
hdfs dfs -rm -R /hdfsWriteTest
