#!/bin/bash

for sample in `ls /home/mattsada/Desktop/GIAB/strand-seq/DATA/mdup/*.bam`
do
dir="/home/mattsada/Desktop/GIAB/strand-seq/DATA/mdup/"
base=$(basename $sample ".bam")
samtools index  ${dir}/${base}.bam > ${dir}/${base}.bai
done