#!/bin/bash

project_dir="/mnt/data0/jupyter-notebook/prashant-nb/cantaloupe"

echo cleaning up output from previous job                                                        
rm -rf ../output/*.txt                                                                           
rm -rf /tmp/seq                                                                                  
echo spark job in progress                                                                       
spark-submit --master local[*] hmmer-spark.py file://${project_dir}/input/uniprot-cancer-2500.fasta
echo spark job completed                                                                         

echo cleaning up output from previous job                                                        
rm -rf ../output/*.txt                                                                           
rm -rf /tmp/seq                                                                                  
echo spark job in progress                                                                       
spark-submit --master local[*] hmmer-spark.py file://${project_dir}/input/uniprot-cancer-5000.fasta 
echo spark job completed                                                                         
