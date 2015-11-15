#!/bin/bash
# SSH to the host machine of ceph monitor nodes, osd node and mds nodes without password(Added the key)
#Start the nodes

echo -e "\n Starting ceph-mon  and ceph-osd 0"
sleep 2s
ssh groupb@groupb21 "virsh start ceph-node2; sleep 10s; ssh root@ceph-node2 \"service ceph start; exit;\" exit"


echo -e "\n ceph-mon ,ceph-osd 1"
sleep 2s
ssh groupb@groupb13 "virsh start ceph-node3; sleep 10s; ssh root@ceph-node3 \"service ceph start; exit;\"; exit"


echo -e "\n Starting ceph-osd 2 "
sleep 2s
ssh groupb@groupb21 "virsh start ceph-node1; sleep 10s; ssh root@ceph-node1 \"service ceph start; exit;\"; exit"



echo -e "\n Starting ceph-mon,ceph-osd 3, ceph-mds and checking the staus"
sleep 2s
ssh groupb@groupb21 "virsh start ceph-admin; sleep 10s; ssh root@ceph-admin \"service ceph start; sleep 10s; ceph status; exit;\"; exit"
