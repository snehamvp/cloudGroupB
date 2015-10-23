#!/bin/bash
#create sample file for testing
mkdir writeTest
dd if=/dev/zero of=writeTest/zerofile bs=4M count=256 conv=fdatasync
hdfs dfs -put writeTest /hdfsWriteTest
hdfs dfs -get /hdfsWriteTest/zerofile

#start recording read time
startRead=$(date -u +"%s")
hdfs dfs -get /hdfsWriteTest/zerofile
#stop recording read time
stopRead=$(date -u +"%s")

#output the re-read time
echo "Re-Read time: $(($stopRead-$startRead)) second"

rm -r -f writeTest
hdfs dfs -rm -R /hdfsWriteTest
rm zerofile
