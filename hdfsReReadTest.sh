#!/bin/bash
export hdfsPath=/usr/local/hadoop/bin/$hdfsPath

#create sample file for testing
mkdir writeTest
dd if=/dev/zero of=writeTest/zerofile bs=$1 count=$2 conv=fdatasync
$hdfsPath dfs -put writeTest /hdfsWriteTest
$hdfsPath dfs -get /hdfsWriteTest/zerofile

#start recording read time
startRead=$(date -u +"%s")
$hdfsPath dfs -get /hdfsWriteTest/zerofile
#stop recording read time
stopRead=$(date -u +"%s")

#output the re-read time
echo "Re-Read time: $(($stopRead-$startRead)) second"
echo "Re-Read time, $(($stopRead-$startRead))" >> hdfsParamOutput.xls
rm -r -f writeTest
$hdfsPath dfs -rm -R /hdfsWriteTest
rm zerofile
