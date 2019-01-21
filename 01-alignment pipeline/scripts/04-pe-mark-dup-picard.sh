#!/bin/bash

for sample in `ls /home/mattsada/Desktop/GIAB/strand-seq/DATA/sorted/pe/*.bam`
do
dir="/home/mattsada/Desktop/GIAB/strand-seq/DATA/sorted/pe/"
base=$(basename $sample ".bam")
java -jar picard.jar MarkDuplicates \
I= ${dir}/${base}.bam \
O= ${dir}/${base}.mdup.bam \
M= /home/mattsada/Desktop/GIAB/strand-seq/metrics/se_mdup.txt
done