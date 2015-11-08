#!/bin/bash
export hdfsPath=/usr/local/hadoop/bin/hdfs

#create sample file for testing
mkdir writeTest
dd if=/dev/zero of=writeTest/zerofile bs=$1 count=$2 conv=fdatasync

#start recording write time
startWrite=$(date -u +"%s")
$hdfsPath dfs -put writeTest /hdfsWriteTest
returnValue=$?
#stop recording write time
stopWrite=$(date -u +"%s")
if [ "$returnValue" == 0 ]
then
	#output the write time
	echo "Write Time: $(($stopWrite-$startWrite)) seconds"
	echo "Write Time, $(($stopWrite-$startWrite))" >> hdfsParamOutput.xls
else
	echo "Error while writing"	
fi
rm -r -f writeTest
$hdfsPath dfs -rm -R /hdfsWriteTest




