#!/bin/bash

for sample in `ls /DATA/fastq/SE/*.fastq`
do
dir="/DATA/fastq/SE/"
base=$(basename $sample ".fastq")
out="/DATA/sam"
bowtie2 -x 'refseq/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index' -U ${dir}/${base}.fastq -S ${out}/${base}.sam
done