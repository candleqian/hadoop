#!/bin/sh
echo "deploy jar"
scp -r /Users/qianchengzhang/git/hadoop/out/artifacts/hadoop_jar/hadoop.jar root@node1:/tools/jars

ssh root@node1 "/usr/local/hadoop/bin/hadoop fs -rm -f /user/output"
ssh root@node1 "/usr/local/hadoop/bin/hadoop fs -rm -f /user/input/hadoop.jar"
ssh root@node1 "/usr/local/hadoop/bin/hadoop fs -rm -f -r /user/qianchengzhang/wordcount"
ssh root@node1 "/usr/local/hadoop/bin/hadoop fs -put /tools/jars/hadoop.jar /user/input"
echo "deploy run.sh"
scp run.sh root@node1:/tools/jars
echo "change authority"
ssh root@node1 "chmod 755 /tools/jars/run.sh"
echo "start run.sh"
ssh root@node1 "/tools/jars/run.sh"