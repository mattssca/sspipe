#!/bin/bash

for sample in `ls ./DATA/fastq/PE/*_R1_001.fastq`
do
dir="./DATA/fastq/PE/"
base=$(basename $sample "_R1_001.fastq")
out="./DATA/sam/"
bowtie2 -x 'refseq/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index' -1 ${dir}/${base}_R1_001.fastq.gz -2 ${dir}/${base}_R2_001.fastq.gz -S ${out}/${base}.sam
done
