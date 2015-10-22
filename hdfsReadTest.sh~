#!/bin/bash
#start recording read time
startRead=$(date -u +"%s")
hdfs dfs -get /hdfsWriteTest/zerofile
#stop recording read time
stopRead=$(date -u +"%s")
#output the read time
echo "$(($stopRead-$startRead)) second"

