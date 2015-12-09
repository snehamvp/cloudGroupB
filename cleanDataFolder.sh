#!/bin/bash
<<<<<<< HEAD
rm -r -f /app/hadoop/tmp/dfs/data
rm -r -f /app/hadoop/tmp/dfs/name
ssh hdfsSlave1 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave2 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave3 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave4 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave5 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave6 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave7 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave8 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave9 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave10 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave11 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave12 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave13 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave14 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave15 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave16 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave17 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave18 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave19 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
ssh hdfsSlave20 "rm -r -f /app/hadoop/tmp/dfs/data;exit"
/usr/local/hadoop/bin/hadoop namenode -format


=======
ssh groupbslave1@groupb12 "ssh hduser@hdfsSlave1 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; ssh hduser@hdfsSlave2 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; ssh hduser@hdfsSlave3 \"rm -r -f /app/hadoop/tmp/dfs/data;exit\"; ssh hduser@hdfsSlave10 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; ssh hduser@hdfsSlave11 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; exit"
ssh groupb@groupb22 "ssh hduser@hdfsSlave4 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; ssh hduser@hdfsSlave5 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; ssh hduser@hdfsSlave12 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; ssh hduser@hdfsSlave13 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; ssh hduser@hdfsSlave14 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; exit"
ssh groupb@groupb23 "ssh hduser@hdfsSlave6 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; ssh hduser@hdfsSlave7 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; ssh hduser@hdfsSlave15 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; ssh hduser@hdfsSlave16 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; ssh hduser@hdfsSlave17 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; ssh hduser@hdfsSlave18 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; ssh hduser@hdfsSlave19 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; ssh hduser@hdfsSlave20 \"rm -r -f /app/hadoop/tmp/dfs/data;exit\"; exit"
ssh groupb@groupb13 "ssh hduser@hdfsSlave8 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; ssh hduser@hdfsSlave9 \"rm -r -f /app/hadoop/tmp/dfs/data; exit\"; ssh hduser@hdfsMaster \"rm -r -f /app/hadoop/tmp/dfs/data; rm -r -f /app/hadoop/tmp/dfs/name; /usr/local/hadoop/bin/hadoop namenode -format; exit\"; exit"
>>>>>>> 9602847a6452e82ed1d9fbcdec2b81f8e9b57b0f
