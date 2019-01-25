#!/bin/bash -l

#$ -cwd
#$ -j y
#$ -P ${project}
#$ -pe omp ${num_cor}
#$ -m be
#$ -M ${email}
#$ -o bcl2fastq.log
#$ -N bcl2fastq

source ~/.bashrc
module load gcc/4.9.2
module load bcl2fastq/2.18

bcl2fastq --runfolder-dir=${FlowCellID} \
  --input-dir=${FlowCellID}/Data/Intensities/BaseCalls/ \ 
  -p 12 \
  --output-dir=${Fastq_Dir} \
  --sample-sheet=${SampleSheet_Dir} \
  --no-lane-splitting
