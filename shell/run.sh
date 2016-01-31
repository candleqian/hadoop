#!/bin/sh
echo "add jar to classpath"
export HADOOPDD_CLASSPATH=/tools/jars/hadoop.jar
echo "run hadoop task"
/usr/local/hadoop/bin/hadoop jar  /tools/jars/hadoop.jar  WordCount wordcount   /user/input/  /user/output/