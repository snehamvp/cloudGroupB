#!/bin/bash
export hdfsPath=/usr/local/hadoop/bin/$hdfsPath

#create sample file for testing
mkdir writeTest
dd if=/dev/zero of=writeTest/zerofile bs=$1 count=$2 conv=fdatasync

#put file on $hdfsPath
$hdfsPath dfs -put writeTest /hdfsWriteTest

#start recording lookup time
startLookup=$(date -u +"%s")
$hdfsPath dfs -find /hdfsWriteTest zerofile
#stop recording read time
stopLookup=$(date -u +"%s")

#output the Lookup time
echo "Lookup time: $(($stopLookup-$startLookup)) second"
echo "Lookup time, $(($stopLookup-$startLookup))" >> hdfsParamOutput.xls

rm -r -f writeTest
$hdfsPath dfs -rm -R /hdfsWriteTest

