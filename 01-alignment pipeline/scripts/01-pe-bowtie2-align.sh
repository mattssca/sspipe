#!/bin/bash

for sample in `ls ./DATA/fastq/PE/*1.fastq`
do
dir="./DATA/fastq/PE"
base=$(basename $sample "_1.fastq")
out="./DATA/sam/"
bowtie2 -x 'refseq/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index' -1 ${dir}/${base}_1.fastq -2 ${dir}/${base}_2.fastq -S ${out}/${base}.sam
done