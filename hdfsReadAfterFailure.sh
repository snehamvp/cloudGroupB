#!/bin/bash
export hdfsPath=/usr/local/hadoop/bin/$hdfsPath

#create sample file for testing
mkdir writeTest
dd if=/dev/zero of=writeTest/zerofile bs=$1 count=$2 conv=fdatasync
$hdfsPath dfs -put writeTest /hdfsWriteTest

#Stop 2 data nodes
ssh hduser@hdfsMaster "ssh hduser@hdfsSlave1 \"bash /usr/local/hadoop/sbin/hadoop-daemon.sh stop datanode; bash /usr/local/hadoop/sbin/yarn-daemon.sh stop nodemanager; jps; exit\"; ssh hduser@hdfsSlave2 \"bash /usr/local/hadoop/sbin/hadoop-daemon.sh stop datanode; bash /usr/local/hadoop/sbin/yarn-daemon.sh stop nodemanager; jps; exit\"; exit"

#start recording read time
startRead=$(date -u +"%s")
$hdfsPath dfs -get /hdfsWriteTest/zerofile
returnValue=$?
#stop recording read time
stopRead=$(date -u +"%s")

if [ "$returnValue" == 0 ]
then
	#output the read time
	echo "Read Time: $(($stopRead-$startRead)) second"
	echo "Read Time, $(($stopRead-$startRead))" >> hdfsParamOutput.xls
else
	echo "Error while reading"	
fi
rm -r -f writeTest
$hdfsPath dfs -rm -R /hdfsWriteTest
rm zerofile

#Start 2 data nodes
ssh hduser@hdfsMaster "ssh hduser@hdfsSlave1 \"bash /usr/local/hadoop/sbin/hadoop-daemon.sh start datanode; bash /usr/local/hadoop/sbin/yarn-daemon.sh start nodemanager; jps; exit\"; ssh hduser@hdfsSlave2 \"bash /usr/local/hadoop/sbin/hadoop-daemon.sh start datanode; bash /usr/local/hadoop/sbin/yarn-daemon.sh start nodemanager; jps; exit\"; exit"
