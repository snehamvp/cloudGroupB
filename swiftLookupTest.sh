#!/bin/bash
# create sample file for testing

for i in {1..2} 
do
<<<<<<< HEAD
dd if=/dev/urandom of=LookUpFile$i bs=4M count=10 conv=fdatasync

# upload file on swift
swift --insecure -A https://$PROXY_LOCAL_NET_IP:8080/auth/v1.0 -U system:root -K testpass upload ContainerLookUp FileLookUp$i
=======
dd if=/dev/urandom of=LookUpFile$i bs=4M count=50 conv=fdatasync

# upload file on swift
swift --insecure -A https://proxyNode:8080/auth/v1.0 -U system:root -K testpass upload LookUp LookUpFile$i
>>>>>>> 313e96fbafe56aaf59abf50506f6debc9b5a2e91

# delete the file from local filesystem
rm -r -f LookUpFile*

done

# start recording lookup time
startLookup=$(date -u +%s%3N)

<<<<<<< HEAD
swift-get-nodes object.ring.gz AUTH_system ContainerLookUp FileLookUp2
=======
swift-get-nodes object.ring.gz AUTH_system LookUp LookUpFile10
>>>>>>> 313e96fbafe56aaf59abf50506f6debc9b5a2e91

# stop recording read time
stopLookup=$(date -u +%s%3N)

# output the Lookup time
echo "Lookup time: $(($stopLookup-$startLookup)) ms" >> /home/swift/CustomizedResult/Lookup.xls

# delete file from swift file system
<<<<<<< HEAD
swift --insecure -A https://$PROXY_LOCAL_NET_IP:8080/auth/v1.0 -U system:root -K testpass delete ContainerLookUp 
=======
swift --insecure -A https://$PROXY_LOCAL_NET_IP:8080/auth/v1.0 -U system:root -K testpass delete LookUp 
>>>>>>> 313e96fbafe56aaf59abf50506f6debc9b5a2e91

