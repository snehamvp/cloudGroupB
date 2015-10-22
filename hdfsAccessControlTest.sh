#!/bin/bash
#start recording Access read time
startAccessRead=$(date -u +"%s")

returnValue=hdfs dfs -getfacl -R /hdfsWriteTest

#stop recording Access read time
stopAccessRead=$(date -u +"%s")

if [$returnValue=0]
then
	#output the Access read time
	echo "Access Read time :: $(($stopAccessRead-$startAccessRead)) seconds"
else
	echo "Error while reading access control list"	
fi

