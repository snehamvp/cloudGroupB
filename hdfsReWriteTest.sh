#!/bin/bash
export hdfsPath=/usr/local/hadoop/bin/hdfs

#create sample file for testing
mkdir writeTest
dd if=/dev/zero of=writeTest/zerofile bs=$1 count=$2 conv=fdatasync
$hdfsPath dfs -put writeTest /hdfsWriteTest

#start recording write time
startWrite=$(date -u +"%s")
$hdfsPath dfs -put zerofile /hdfsWriteTest
#stop recording write time
stopWrite=$(date -u +"%s")

#output the write time
echo "Re-Write time :: $(($stopWrite-$startWrite)) seconds"
echo "Re-Write time, $(($stopWrite-$startWrite))" >> hdfsParamOutput.xls
rm -r -f writeTest
$hdfsPath dfs -rm -R /hdfsWriteTest
