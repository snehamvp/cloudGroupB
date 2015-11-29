#!/bin/bash
export hdfsPath=/usr/local/hadoop/bin/hdfs

#create sample file for testing
mkdir writeTest
dd if=/dev/zero of=writeTest/zerofile bs=$1 count=$2 conv=fdatasync
$hdfsPath dfs -put writeTest /hdfsWriteTest
$hdfsPath dfs -get /hdfsWriteTest/zerofile

#start recording read time
startRead=$(($(date +%s%N)/1000000))
$hdfsPath dfs -get /hdfsWriteTest/zerofile
#stop recording read time
stopRead=$(($(date +%s%N)/1000000))

#output the re-read time
echo "Re-Read time: $(($stopRead-$startRead)) ms"
echo "$(($1*$2/1000)), $(($stopRead-$startRead))" >> hdfsReReadOutput.xls
rm -r -f writeTest
$hdfsPath dfs -rm -R /hdfsWriteTest
rm zerofile
