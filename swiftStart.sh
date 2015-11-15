#!/bin/bash
# SSH to the host machine of swift storage nodes and proxy node without password(Added the key)
#Start the storage nodes
ssh groupb@groupb23 "virsh start proxyNode; sleep 10s; ssh swift@proxyNode \"swift-init proxy start; exit;\"; virsh start storageNode7; sleep 10s; ssh swift@storageNode7 \"swift-init all start; exit;\"; exit"

ssh groupb@groupb13 "virsh start storageNode1; sleep 10s; ssh swift@storageNode1 \"swift-init all start; exit;\"; virsh start storageNode2; sleep 10s; ssh swift@storageNode2 \"swift-init all start; exit;\"; virsh start storageNode3; sleep 10s; ssh swift@storageNode3 \"swift-init all start; exit;\"; exit"

ssh groupb@groupb21 "virsh start storageNode4; sleep 10s; ssh swift@storageNode4 \"swift-init all start; exit;\"; virsh start storageNode5; sleep 10s; ssh swift@storageNode5 \"swift-init all start; exit;\"; exit"

ssh groupb@groupb22 "virsh start storageNode6; sleep 10s; ssh swift@storageNode6 \"swift-init all start; exit;\"; exit"
