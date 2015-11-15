#!/bin/bash
#SSH to the host machine of swift storage nodes and proxy node without password(Added the key)
#Stop the storage nodes
#ssh groupb@groupb23  "sleep 5s; ssh swift@proxyNode ;exit;"
echo -e "\n\nStopping proxynode and storageNode 7"
sleep 2s
ssh groupb@groupb23 "sleep 15s; ssh swift@proxyNode \"swift-init proxy stop; sudo shutdown -P now;\"; sleep 15s; ssh swift@storageNode7 \"swift-init all stop; sudo shutdown -P now;\"; exit"

echo -e "\n\nStopping storageNode 1,2 and 3"
sleep 2s
ssh groupb@groupb13 "sleep 15s; ssh swift@storageNode1 \"swift-init all stop; sudo shutdown -P now;\"; sleep 15s; ssh swift@storageNode2 \"swift-init all stop; sudo shutdown -P now;\"; sleep 15s; ssh swift@storageNode3 \"swift-init all stop; sudo shutdown -P now;\"; exit"

echo -e "\n\nStopping storageNode 4 and 5"
sleep 2s
ssh groupb@groupb21 "sleep 15s; ssh swift@storageNode4 \"swift-init all stop; sudo shutdown -P now;\"; sleep 15s; ssh swift@storageNode5  \"swift-init all stop; sudo shutdown -P now;\"; exit"

echo -e "\n\nStopping storageNode 6"
sleep 2s
ssh groupb@groupb22 "sleep 15s; ssh swift@storageNode6 \"swift-init all stop; sudo shutdown -P now;\"; exit"

echo -e "\n\n *** Stopped all Swift nodes and services ***"



