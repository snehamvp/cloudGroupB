#!/bin/bash
#SSH to the host machine of swift storage nodes and proxy node without password(Added the key)
#Stop the storage nodes
ssh groupb@groupb23 "ssh swift@proxyNode \"swift-init proxy stop; exit;\"; ssh swift@swift-storageNode7 \"swift-init all stop; exit;\"; exit"

ssh groupb@groupb13 "ssh swift@storageNode1 \"swift-init proxy stop; exit;\"; ssh swift@storageNode2 \"swift-init all stop; exit;\"; ssh swift@swift-storageNode3 \"swift-init all stop; exit;\"; exit"

ssh groupb@groupb21 "ssh swift@storageNode4 \"swift-init proxy stop; exit;\"; ssh swift@storageNode5 \"swift-init all stop; exit;\"; exit"

ssh groupb@groupb22 "ssh swift@storageNode6 \"swift-init proxy stop; exit;\"; exit"
