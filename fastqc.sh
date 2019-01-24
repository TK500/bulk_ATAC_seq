#!/bin/bash -l

module load fastqc

fastqc ./*P.fq.gz -o ./$Directory/
