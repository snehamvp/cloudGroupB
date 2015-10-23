#!/bin/bash
#start recording read time
hdfs dfs -get /hdfsWriteTest/zerofile
startRead=$(date -u +"%s")
hdfs dfs -get /hdfsWriteTest/zerofile
#stop recording read time
stopRead=$(date -u +"%s")
#output the read time
echo "Re-Read time: $(($stopRead-$startRead)) second"
