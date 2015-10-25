#!/bin/bash
#create sample file for testing
mkdir writeTest
dd if=/dev/zero of=writeTest/zerofile bs=4M count=256 conv=fdatasync

#put file on HDFS
hdfs dfs -put writeTest /hdfsWriteTest

#start recording lookup time
startLookup=$(date -u +"%s")
hdfs dfs -find /hdfsWriteTest zerofile
#stop recording read time
stopLookup=$(date -u +"%s")

#output the Lookup time
echo "Lookup time: $(($stopLookup-$startLookup)) second"
echo "Lookup time, $(($stopLookup-$startLookup))" >> hdfsParamOutput.xls

rm -r -f writeTest
hdfs dfs -rm -R /hdfsWriteTest

