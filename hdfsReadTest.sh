#!/bin/bash
#start recording read time
startRead=$(date -u +"%s")
returnValue=hdfs dfs -get /hdfsWriteTest/zerofile
#stop recording read time
stopRead=$(date -u +"%s")

if [$returnValue=0]
then
	#output the read time
	echo "$(($stopRead-$startRead)) second"
else
	echo "Error while reading"	
fi

