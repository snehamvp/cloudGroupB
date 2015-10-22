#!/bin/bash
#Delete file locally
rm zerofile

#Delete File from HDFS
hdfs dfs -rm -skipTrash -R /hdfsWriteTest
