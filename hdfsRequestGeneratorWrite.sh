#!/bin/bash
#takes four arguments:
#First: block size, Second: number of blocks
#Third: random directory path, Fourth:Random Number to be appended in the file name
export hdfsPath=/usr/local/hadoop/bin/hdfs
filename="zerofile$4"
echo "File name to be created: $filename"
#create sample file for testing
mkdir writeTest
dd if=/dev/zero of=writeTest/$filename bs=$1 count=$2 conv=fdatasync
randomDir=$3
echo "random directory path: $randomDir"
#start recording write time
startWrite=$(date +%s%N)
$hdfsPath dfs -put writeTest $randomDir 
returnValue=$?
#stop recording write time
stopWrite=$(date +%s%N)
if [ "$returnValue" == 0 ]
then
	#output the write time
	writeTimeNano=$(($stopWrite-$startWrite))
	writeTime=$(($writeTimeNano/1000000))
	echo "Write Time: $writeTime ms"
	#echo "$(($1*$2/1000)), $writeTime" >> hdfsWriteOutput.xls
else
	echo "Error while writing"	
fi
rm -r -f writeTest
