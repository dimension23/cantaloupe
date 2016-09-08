#!/bin/bash

rm -rf ../output/summary.txt
echo small.fasta time test
start_time=${SECONDS}
<<<<<<< HEAD
../src/hmmscan --domtblout ../output/summary.txt -o /tmp/hmmscan-stdout '../database/pfam/Pfam-A.hmm' '../database/sequence/small.fasta'
=======
../src/hmmscan --domtblout ../output/summary.txt -o /tmp/hmmscan-stdout '/home/cloudera/cantaloupe/database/pfam/Pfam-A.hmm' '../database/sequence/small.fasta'
>>>>>>> bc6ceb6eda7d2b1fa44558e0e50ad078adb3dea9
end_time=${SECONDS}
diff_time=`expr ${end_time} - ${start_time}`
echo small.fasta took `date +%H:%M:%S -ud @${diff_time}`
echo ...

rm -rf ../output/summary.txt
echo medium.fasta time test
start_time=${SECONDS}
<<<<<<< HEAD
../src/hmmscan --domtblout ../output/summary.txt -o /tmp/hmmscan-stdout '../database/pfam/Pfam-A.hmm' '../database/sequence/medium.fasta'
=======
../src/hmmscan --domtblout ../output/summary.txt -o /tmp/hmmscan-stdout '/home/cloudera/cantaloupe/database/pfam/Pfam-A.hmm' '../database/sequence/medium.fasta'
>>>>>>> bc6ceb6eda7d2b1fa44558e0e50ad078adb3dea9
end_time=${SECONDS}
diff_time=`expr ${end_time} - ${start_time}`
echo medium.fasta took `date +%H:%M:%S -ud @${diff_time}`
echo ...

rm -rf ../output/summary.txt
echo large.fasta time test
start_time=${SECONDS}
<<<<<<< HEAD
../src/hmmscan --domtblout ../output/summary.txt -o /tmp/hmmscan-stdout '../database/pfam/Pfam-A.hmm' '../database/sequence/large.fasta'
=======
../src/hmmscan --domtblout ../output/summary.txt -o /tmp/hmmscan-stdout '/home/cloudera/cantaloupe/database/pfam/Pfam-A.hmm' '../database/sequence/large.fasta'
>>>>>>> bc6ceb6eda7d2b1fa44558e0e50ad078adb3dea9
end_time=${SECONDS}
diff_time=`expr ${end_time} - ${start_time}`
echo large.fasta took `date +%H:%M:%S -ud @${diff_time}`
echo ...
