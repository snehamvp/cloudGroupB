#!/bin/bash
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
rm zerofile
