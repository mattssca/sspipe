#!/bin/bash

for sample in `ls /home/mattsada/Desktop/GIAB/strand-seq/DATA/SE/*.fastq`
do
dir="/home/mattsada/Desktop/GIAB/strand-seq/DATA/SE/"
base=$(basename $sample ".fastq")
bowtie2 -x '/home/mattsada/Desktop/alignmentpipe/data/refseq/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index' -U ${dir}/${base}.fastq -S ${dir}/${base}.sam
done