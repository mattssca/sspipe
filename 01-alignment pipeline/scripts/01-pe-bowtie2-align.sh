#!/bin/bash

for sample in `ls /media/mattsada/mattsada_2TB/DATA/HGSV/CHS/HG00514/*1.fastq.gz`
do
dir="/media/mattsada/mattsada_2TB/DATA/HGSV/CHS/HG00514/"
base=$(basename $sample "_1.fastq.gz")
out="./DATA/sam/"
bowtie2 -x 'refseq/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index' -1 ${dir}/${base}_1.fastq.gz -2 ${dir}/${base}_2.fastq.gz -S ${out}/${base}.sam
done