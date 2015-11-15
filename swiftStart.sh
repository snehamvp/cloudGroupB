#!/bin/bash
# SSH to the host machine of swift storage nodes and proxy node without password(Added the key)
#Start the storage nodes
echo -e "\n Starting proxynode and storagenode 7"
sleep 2s
ssh groupb@groupb23 "virsh start proxyNode; sleep 15s; ssh swift@proxyNode \"swift-init proxy start; exit;\"; virsh start storageNode7; sleep 15s; ssh swift@storageNode7 \"swift-init all start; exit;\"; exit"

echo -e "\n Starting storagenode 1,2 and 3"
sleep 2s
ssh groupb@groupb13 "virsh start storageNode1; sleep 15s; ssh swift@storageNode1 \"swift-init all start; exit;\"; virsh start storageNode2; sleep 15s; ssh swift@storageNode2 \"swift-init all start; exit;\"; virsh start storageNode3; sleep 15s; ssh swift@storageNode3 \"swift-init all start; exit;\"; exit"

echo -e "\n Starting storagenode 4 and 5"
sleep 2s
ssh groupb@groupb21 "virsh start storageNode4; sleep 15s; ssh swift@storageNode4 \"swift-init all start; exit;\"; virsh start storageNode5; sleep 15s; ssh swift@storageNode5 \"swift-init all start; exit;\"; exit"

echo -e "\n Starting storagenode 6"
sleep 2s
ssh groupb@groupb22 "virsh start storageNode6; sleep 15s; ssh swift@storageNode6 \"swift-init all start; exit;\"; exit"
