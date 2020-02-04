#!/bin/bash

for sample in `ls ./testdata/out/sam/*.sam`
do
dir="./testdata/out/sam/"
base=$(basename $sample ".sam")
out="./testdata/out/bam/"
samtools view -bS ${dir}/${base}.sam > ${out}/${base}.bam
done
