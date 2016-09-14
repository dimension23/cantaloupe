#!/bin/bash

rm -rf ../output/summary.txt
echo small.fasta time test
start_time=${SECONDS}
../src/hmmscan --domtblout ../output/summary.txt -o /tmp/hmmscan-stdout '../database/pfam/Pfam-A.hmm' '../database/sequence/small.fasta'
end_time=${SECONDS}
diff_time=`expr ${end_time} - ${start_time}`
echo small.fasta took `date +%H:%M:%S -ud @${diff_time}`
echo ...

rm -rf ../output/summary.txt
echo medium.fasta time test
start_time=${SECONDS}
../src/hmmscan --domtblout ../output/summary.txt -o /tmp/hmmscan-stdout '../database/pfam/Pfam-A.hmm' '../database/sequence/medium.fasta'
end_time=${SECONDS}
diff_time=`expr ${end_time} - ${start_time}`
echo medium.fasta took `date +%H:%M:%S -ud @${diff_time}`
echo ...

rm -rf ../output/summary.txt
echo large.fasta time test
start_time=${SECONDS}
../src/hmmscan --domtblout ../output/summary.txt -o /tmp/hmmscan-stdout '../database/pfam/Pfam-A.hmm' '../database/sequence/large.fasta'
end_time=${SECONDS}
diff_time=`expr ${end_time} - ${start_time}`
echo large.fasta took `date +%H:%M:%S -ud @${diff_time}`
echo ...
