#!/bin/bash
#create sample file for testing
mkdir writeTest
dd if=/dev/zero of=writeTest/zerofile bs=4M count=25 conv=fdatasync

#start recording write time
startWrite=$(date -u +"%s")
hdfs dfs -put writeTest /hdfsWriteTest
returnValue=$?
#stop recording write time
stopWrite=$(date -u +"%s")
if [ "$returnValue" == 0 ]
then
	#output the write time
	echo "Write Time: $(($stopWrite-$startWrite)) seconds"
else
	echo "Error while writing"	
fi
rm -r -f writeTest
hdfs dfs -rm -R /hdfsWriteTest
