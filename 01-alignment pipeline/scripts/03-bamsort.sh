#!/bin/bash

for sample in `ls /home/mattsada/Desktop/GIAB/strand-seq/DATA/unsorted/*.bam`
do
dir="/home/mattsada/Desktop/GIAB/strand-seq/DATA/unsorted/"
base=$(basename $sample ".bam")
samtools sort ${dir}/${base}.bam > ${dir}/${base}sorted.bam
done
