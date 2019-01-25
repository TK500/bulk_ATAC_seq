#!/bin/bash -l

#set batch arguments
#$ -cwd
#$ -j y
#$ -P ${project}
#$ -pe omp ${num_cores}
#$ -m be
#$ -M ${email}
#$ -o trim.log
#$ -N trim

source ~/.bashrc

module load trimmomatic/0.33

for filename in ./*_R1_001.fastq.gz 

do

java -jar $SCC_TRIMMOMATIC_BIN/trimmomatic.jar PE  "$filename" -threads ${num_cores} ${directory}/$(basename "$filename" R1_001.fastq.gz)R2_001.fastq.gz  ${directory}/$(basename "$filename" R1_001.fastq.gz)1P.fq.gz  ${directory}/$(basename "$filename" R1_001.fastq.gz)1U.fq.gz  ${directory}/$(basename "$filename" R1_001.fastq.gz)2P.fq.gz  ${directory}/$(basename "$filename" R1_001.fastq.gz)2U.fq.gz   HEADCROP:12


done
