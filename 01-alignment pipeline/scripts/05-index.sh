#!/bin/bash

for sample in `ls ./DATA/mdup/*.bam`
do
dir="./DATA/mdup/"
base=$(basename $sample ".bam")
samtools index  ${dir}/${base}.bam > ${dir}/${base}.bai
done
