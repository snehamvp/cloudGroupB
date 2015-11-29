#!/bin/bash
export hdfsPath=/usr/local/hadoop/bin/hdfs

#create sample file for testing
mkdir writeTest
dd if=/dev/zero of=writeTest/zerofile bs=$1 count=$2 conv=fdatasync
$hdfsPath dfs -put writeTest /hdfsWriteTest

#start recording read time
startRead=$(($(date +%s%N)/1000000))
pathVal="$($hdfsPath dfs -find / -name zerofile)"
echo "pathVal= $pathVal"
$hdfsPath dfs -get $pathVal
returnValue=$?
#stop recording read time
stopRead=$(($(date +%s%N)/1000000))

if [ "$returnValue" == 0 ]
then
	#output the read time
	echo "Read Time: $(($stopRead-$startRead)) ms"
	echo "$(($1*$2/1000)), $(($stopRead-$startRead))" >> hdfsReadOutput.xls
else
	echo "Error while reading"	
fi
rm -r -f writeTest
$hdfsPath dfs -rm -R /hdfsWriteTest
rm zerofile
