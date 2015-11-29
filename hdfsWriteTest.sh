#!/bin/bash
export hdfsPath=/usr/local/hadoop/bin/hdfs

#create sample file for testing
mkdir writeTest
dd if=/dev/zero of=writeTest/zerofile bs=$1 count=$2 conv=fdatasync

#start recording write time
startWrite=$(($(date +%s%N)/1000000))
$hdfsPath dfs -put writeTest /hdfsWriteTest
returnValue=$?
#stop recording write time
stopWrite=$(($(date +%s%N)/1000000))
if [ "$returnValue" == 0 ]
then
	#output the write time
	echo "Write Time: $(($stopWrite-$startWrite)) ms"
	echo "$(($1*$2/1000)), $(($stopWrite-$startWrite))" >> hdfsWriteOutput.xls
else
	echo "Error while writing"	
fi
rm -r -f writeTest
$hdfsPath dfs -rm -R /hdfsWriteTest




