#!/bin/bash

for sample in `ls ./testdata/chr16-lib/*_1.fastq.gz`
do
dir="./testdata/chr16-lib/"
base=$(basename $sample "_1.fastq.gz")
out="./testdata/out/sam"
bowtie2 -x 'testdata/chr16-ref/GRCh38-chr16' -1 ${dir}/${base}_1.fastq.gz -2 ${dir}/${base}_2.fastq.gz -S ${out}/${base}.sam
done