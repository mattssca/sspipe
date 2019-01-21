#!/bin/bash

for sample in `ls /home/mattsada/Desktop/GIAB/strand-seq/DATA/sam/*.sam`
do
dir="/home/mattsada/Desktop/GIAB/strand-seq/DATA/mdup/"
base=$(basename $sample ".bam")
samtools flagstat ${dir}/${base}.bam
done