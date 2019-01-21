#!/bin/bash

for sample in `ls /home/mattsada/Desktop/GIAB/strand-seq/DATA/PE/aligned/*.sam`
do
dir="/home/mattsada/Desktop/GIAB/strand-seq/DATA/PE/aligned/"
base=$(basename $sample ".sam")
samtools view -bS ${dir}/${base}.sam > ${dir}/${base}.bam
done