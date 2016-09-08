#!/bin/sh
while read LINE; do
   name=$(echo ${LINE} | grep  -o -P '(?<=>).*(?=#)')
   echo ${LINE} | awk 'BEGIN{RS="#"}{$1=$1}1' > /tmp/seq
   ./hmmscan --domtblout ../output/summary-$name.txt -o /tmp/hmmscan-stdout '/home/cloudera/cantaloupe/database/pfam/Pfam-A.hmm' '/tmp/seq'
done
