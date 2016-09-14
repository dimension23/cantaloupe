#!/bin/sh
project_dir="/home/cloudera/cantaloupe"
#project_dir="/mnt/data0/jupyter-notebook/prashant-nb/cantaloupe"
while read LINE; do
   name=$(echo ${LINE} | grep  -o -P '(?<=>).*(?=#)')
   echo ${LINE} | awk 'BEGIN{RS="#"}{$1=$1}1' > /tmp/seq
   ./hmmscan --domtblout ../output/summary-$name.txt -o /tmp/hmmscan-stdout ${project_dir}/database/pfam/Pfam-A.hmm '/tmp/seq'
done
