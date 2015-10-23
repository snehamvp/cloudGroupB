#!/bin/bash
#create sample file for testing
mkdir writeTest
dd if=/dev/zero of=writeTest/zerofile bs=4M count=25 conv=fdatasync
hdfs dfs -put writeTest /hdfsWriteTest

#start recording read time
startRead=$(date -u +"%s")
hdfs dfs -get /hdfsWriteTest/zerofile
returnValue=$?
#stop recording read time
stopRead=$(date -u +"%s")

if [ "$returnValue" == 0 ]
then
	#output the read time
	echo "Read Time: $(($stopRead-$startRead)) second"
else
	echo "Error while reading"	
fi
rm -r -f writeTest
hdfs dfs -rm -R /hdfsWriteTest
rm zerofile
