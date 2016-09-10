#!/bin/bash
echo cleaning up output from previous job
rm -rf ../output/*.txt
rm -rf /tmp/seq
echo spark job in progress
spark-submit --master local[*] hmmer-spark.py file:///home/cloudera/cantaloupe/input/small.fasta
echo spark job completed

echo cleaning up output from previous job
rm -rf ../output/*.txt
rm -rf /tmp/seq
echo spark job in progress
spark-submit --master local[*] hmmer-spark.py file:///home/cloudera/cantaloupe/input/medium.fasta
echo spark job completed

echo cleaning up output from previous job
rm -rf ../output/*.txt
rm -rf /tmp/seq
echo spark job in progress
spark-submit --master local[*] hmmer-spark.py file:///home/cloudera/cantaloupe/input/large.fasta
echo spark job completed


