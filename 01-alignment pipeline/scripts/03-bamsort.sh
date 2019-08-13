#!/bin/bash

for sample in `ls ./DATA/bam/*.bam`
do
dir="./DATA/bam/"
base=$(basename $sample ".bam")
out="./DATA/sorted/"
samtools sort ${dir}/${base}.bam -o ${out}/${base}.sorted.bam
done
