import sys
from pyspark import SparkConf, SparkContext
import datetime

APP_NAME = "hmmer-spark testing"

def main(sc,filename):

    a = datetime.datetime.now()
    scriptPath = "hmmer.sh"    

    small_seq_db  = "file:///home/cloudera/cantaloupe/input/small.fasta"
    medium_seq_db = "file:///home/cloudera/cantaloupe/input/medium.fasta"
    large_seq_db  = "file:///home/cloudera/cantaloupe/input/large.fasta"
 
    # small dataset
    a = datetime.datetime.now()
    data = sc.textFile(filename)
    pipeRDD = data.pipe(scriptPath)
    pipeRDD.collect()
    b = datetime.datetime.now()
    print "**** %s ***" % filename
    print " "
    print (b-a)
    print " "
    print "************************************************************"

if __name__ == "__main__":
    conf = SparkConf().setAppName(APP_NAME)
    conf = conf.setMaster("local[*]")
    sc   = SparkContext(conf=conf)
    filename = str(sys.argv[1])
    main(sc,filename)
    sc.stop()
