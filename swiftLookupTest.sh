#!/bin/bash
# create sample file for testing

for i in {1..20} 
do
dd if=/dev/urandom of=randomFile$i bs=4M count=20 conv=fdatasync

# upload file on swift
swift --insecure -A https://$PROXY_LOCAL_NET_IP:8080/auth/v1.0 -U system:root -K testpass upload myfiles randomFile$i

done

# start recording lookup time
startLookup=$(($(date -u +%s)*1000))
#curl --insecure -i  https://$PROXY_LOCAL_NET_IP:8080/v1/AUTH_system/myfiles/randomFile2 -X HEAD -H "X-Auth-Token: AUTH_tkf363e225ad6c4fe485153b8c2d39d11d"

swift --insecure -A https://$PROXY_LOCAL_NET_IP:8080/auth/v1.0 -U system:root -K testpass stat myfiles randomFile10

# stop recording read time
stopLookup=$(($(date -u +%s)*1000))

# output the Lookup time
echo "Lookup time: $(($stopLookup-$startLookup)) ms" >> /home/swift/CustomizedResult/Lookup.xls

# delete the file from local filesystem
rm -r -f randomFile*
# delete file from swift file system
swift --insecure -A https://$PROXY_LOCAL_NET_IP:8080/auth/v1.0 -U system:root -K testpass delete myfiles 

