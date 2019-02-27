#!/bin/bash

for sample in `ls ./DATA/sam/*.sam`
do
dir="./DATA/sam/"
base=$(basename $sample ".sam")
out="./DATA/bam"
samtools view -bS ${dir}/${base}.sam > ${out}/${base}.bam
done
