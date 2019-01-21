#!/bin/bash

for sample in `ls /home/mattsada/Desktop/GIAB/strand-seq/DATA/PE/*1.fastq`
do
dir="/home/mattsada/Desktop/GIAB/strand-seq/DATA/PE/"
base=$(basename $sample "_1.fastq")
bowtie2 -x '/home/mattsada/Desktop/alignmentpipe/data/refseq/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index' -1 ${dir}/${base}_1.fastq -2 ${dir}/${base}_2.fastq -S ${dir}/${base}.sam
done