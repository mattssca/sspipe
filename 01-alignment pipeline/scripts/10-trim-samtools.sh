#!/bin/bash

#using samtools to trim bam files for unwanted chromosomes
for sample in `ls ./DATA/bam/*.bam`
do
dir="./DATA/bam/"
base=$(basename $sample ".bam")
trimmed="./DATA/trimmed/"
samtools view -b ${dir}/${base}.bam chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chr20 chr21 chr22 chrX chrY > ${trimmed}/${base}.trimmed.bam
done