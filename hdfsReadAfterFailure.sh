#!/bin/zsh
export hdfsPath=/usr/local/hadoop/bin/hdfs

#create sample file for testing
mkdir writeTest
dd if=/dev/zero of=writeTest/zerofile bs=$1 count=$2 conv=fdatasync
#$hdfsPath dfs -put writeTest /hdfsWriteTest

block1=($($hdfsPath fsck /MapRedInputData/largeFile.csv -files -blocks -locations | grep -c "128.21"))
block2=($($hdfsPath fsck /MapRedInputData/largeFile.csv -files -blocks -locations | grep -c "128.22"))
block3=($($hdfsPath fsck /MapRedInputData/largeFile.csv -files -blocks -locations | grep -c "128.23"))
block4=($($hdfsPath fsck /MapRedInputData/largeFile.csv -files -blocks -locations | grep -c "128.52"))
block5=($($hdfsPath fsck /MapRedInputData/largeFile.csv -files -blocks -locations | grep -c "128.53"))
block6=($($hdfsPath fsck /MapRedInputData/largeFile.csv -files -blocks -locations | grep -c "128.63"))
block7=($($hdfsPath fsck /MapRedInputData/largeFile.csv -files -blocks -locations | grep -c "128.64"))

declare -A blocksIP
blocksIP=(["10.176.128.21"]=$block1 ["10.176.128.22"]=$block2 ["10.176.128.23"]=$block3 ["10.176.128.52"]=$block4 ["10.176.128.53"]=$block5 ["10.176.128.63"]=$block6 ["10.176.128.64"]=$block7)
#blocksIP=($block1=["10.176.128.21"] $block2=["10.176.128.22"] $block3=["10.176.128.23"] $block4=["10.176.128.52"] $block5=["10.176.128.53"] $block6=["10.176.128.63"] $block7=["10.176.128.64"])
echo "${blocksIP[@]}"

ipArray=()
IFS=$'\n'
set -f
ipArray=($(
	for key in "${!blocksIP[@]}"
	do
		printf '%s %s\n' "$key" "${blocksIP[$key]}"
#	done | sort -t : -k 2n | sed 's/:.*//'))
	done | sort -k2nr | sed 's/:.*//'))
unset IFS
set +f

#echo "${ipArray[@]}"
IFS=' ' read -a ips <<< "$ip1"
ip1=$(echo ${ipArray[0]} | tr " " "\n")
echo "${ips[0]}"

ip2=${ipArray[1]}
echo "$ip2"

ip3=${ipArray[2]}
echo "$ip3"

#Stop 3 data nodes that contain maximum blocks
#ssh hduser@$ip1 "bash /usr/local/hadoop/sbin/hadoop-daemon.sh stop datanode; bash /usr/local/hadoop/sbin/yarn-daemon.sh stop nodemanager; jps; exit"
#ssh hduser@$ip2 "bash /usr/local/hadoop/sbin/hadoop-daemon.sh stop datanode; bash /usr/local/hadoop/sbin/yarn-daemon.sh stop nodemanager; jps; exit"
#ssh hduser@$ip3 "bash /usr/local/hadoop/sbin/hadoop-daemon.sh stop datanode; bash /usr/local/hadoop/sbin/yarn-daemon.sh stop nodemanager; jps; exit"

#start recording read time
#startRead=$(date -u +"%s")
#$hdfsPath dfs -get /hdfsWriteTest/zerofile
#returnValue=$?
#stop recording read time
#stopRead=$(date -u +"%s")

#if [ "$returnValue" == 0 ]
#then
	#output the read time
#	echo "Read Time: $(($stopRead-$startRead)) second"
#	echo "Read Time, $(($stopRead-$startRead))" >> hdfsParamOutput.xls
#else
#	echo "Error while reading"	
#fi
#rm -r -f writeTest
#$hdfsPath dfs -rm -R /hdfsWriteTest
#rm zerofile

#Start 3 data nodes
#ssh hduser@$ip1 "bash /usr/local/hadoop/sbin/hadoop-daemon.sh start datanode; bash /usr/local/hadoop/sbin/yarn-daemon.sh start nodemanager; jps; exit"
#ssh hduser@$ip2 "bash /usr/local/hadoop/sbin/hadoop-daemon.sh start datanode; bash /usr/local/hadoop/sbin/yarn-daemon.sh start nodemanager; jps; exit"
#ssh hduser@$ip3 "bash /usr/local/hadoop/sbin/hadoop-daemon.sh start datanode; bash /usr/local/hadoop/sbin/yarn-daemon.sh start nodemanager; jps; exit"
