#!/bin/bash

for sample in `ls ./DATA/mdup/*.bam`
do
dir="./DATA/mdup/"
out="./metrics/CollectAlignmentMetrics/"
base=$(basename $sample ".bam")
java -jar '/home/mattsada/packages/picard-2.18.11/picard.jar' CollectAlignmentSummaryMetrics \
R=./refseq/hg38.fa \
I=${dir}/${base}.bam \
O=${out}/${base}.colalmet.txt
done

