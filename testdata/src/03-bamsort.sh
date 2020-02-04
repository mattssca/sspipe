#!/bin/bash

for sample in `ls ./testdata/out/bam/*.bam`
do
dir="./testdata/out/bam/"
base=$(basename $sample ".bam")
out="./testdata/out/sorted/"
samtools sort ${dir}/${base}.bam -o ${out}/${base}.sorted.bam
done