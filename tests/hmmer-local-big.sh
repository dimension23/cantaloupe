#!/bin/bash

rm -rf ../output/summary.txt
echo uniprot-cancer-2500.fasta time test
start_time=${SECONDS}
../src/hmmscan --domtblout ../output/summary.txt -o /tmp/hmmscan-stdout '../database/pfam/Pfam-A.hmm' '../database/sequence/uniprot-cancer-2500.fasta'
end_time=${SECONDS}
diff_time=`expr ${end_time} - ${start_time}`
echo uniprot-cancer-2500.fasta took `date +%H:%M:%S -ud @${diff_time}`
echo ...

rm -rf ../output/summary.txt
echo uniprot-cancer-5000.fasta time test
start_time=${SECONDS}
../src/hmmscan --domtblout ../output/summary.txt -o /tmp/hmmscan-stdout '../database/pfam/Pfam-A.hmm' '../database/sequence/uniprot-cancer-5000.fasta'
end_time=${SECONDS}
diff_time=`expr ${end_time} - ${start_time}`
echo uniprot-cancer-5000.fasta took `date +%H:%M:%S -ud @${diff_time}`
echo ...

