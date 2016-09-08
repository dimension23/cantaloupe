from pyspark import SparkConf, SparkContext
import datetime

APP_NAME = "hmmer-spark testing"

def main(sc):

    a = datetime.datetime.now()
    scriptPath = "hmmer.sh"    

    small_seq_db  = "file:///home/cloudera/cantaloupe/input/small.fasta"
    medium_seq_db = "file:///home/cloudera/cantaloupe/input/medium.fasta"
    large_seq_db  = "file:///home/cloudera/cantaloupe/input/large.fasta"
 
    # small dataset
    a = datetime.datetime.now()
    data = sc.textFile(small_seq_db)
    pipeRDD = data.pipe(scriptPath)
    pipeRDD.collect()
    b = datetime.datetime.now()
    print "**** TIME : SMALL SEQ DATASET ***"
    print (b-a)
    print "*********************************"

    # medium dataset
    a = datetime.datetime.now()
    data = sc.textFile(medium_seq_db)
    pipeRDD = data.pipe(scriptPath)
    pipeRDD.collect()
    b = datetime.datetime.now()
    print "**** TIME : MEDIUM SEQ DATASET ***"
    print (b-a)
    print "**********************************"

    # large dataset
    data = sc.textFile(large_seq_db)
    pipeRDD = data.pipe(scriptPath)
    pipeRDD.collect()
    b = datetime.datetime.now()
    print "**** TIME : LARGE SEQ DATASET ***"
    print (b-a)
    print "*********************************"

if __name__ == "__main__":
    conf = SparkConf().setAppName(APP_NAME)
    conf = conf.setMaster("local[*]")
    sc   = SparkContext(conf=conf)
    main(sc)
