#!/bin/bash
#create sample file for testing
dd if=/dev/zero of=zerofile bs=4M count=25 conv=fdatasync
hdfs dfs -put zerofile /hdfsWriteTest
#start recording write time
startWrite=$(date -u +"%s")
returnValue=hdfs dfs -put zerofile /hdfsWriteTest
#stop recording write time
stopWrite=$(date -u +"%s")

if [$returnValue=0]
then
	#output the write time
	echo "Re-Write time :: $(($stopWrite-$startWrite)) seconds"
else
	echo "Error while re-writing"	
fi

