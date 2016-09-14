#!/bin/bash

project_dir="/home/cloudera/cantaloupe"
#project_dir="/mnt/data0/jupyter-notebook/prashant-nb/cantaloupe"

echo cleaning up output from previous job
rm -rf ../output/*.txt
rm -rf /tmp/seq
echo spark job in progress
spark-submit --master local[*] hmmer-spark.py file://${project_dir}/input/small.fasta
echo spark job completed

echo cleaning up output from previous job
rm -rf ../output/*.txt
rm -rf /tmp/seq
echo spark job in progress
spark-submit --master local[*] hmmer-spark.py file://${project_dir}/input/medium.fasta
echo spark job completed

echo cleaning up output from previous job
rm -rf ../output/*.txt
rm -rf /tmp/seq
echo spark job in progress
spark-submit --master local[*] hmmer-spark.py file://${project_dir}/input/large.fasta
echo spark job completed

