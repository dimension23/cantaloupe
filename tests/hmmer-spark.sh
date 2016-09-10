#!/bin/bash
rm -rvf ../output/*.txt
spark-submit --master local[*] hmmer-spark.py file:///home/cloudera/cantaloupe/input/small.fasta
rm -rvf ../output/*.txt
spark-submit --master local[*] hmmer-spark.py file:///home/cloudera/cantaloupe/input/medium.fasta
rm -rvf ../output/*.txt
spark-submit --master local[*] hmmer-spark.py file:///home/cloudera/cantaloupe/input/large.fasta


