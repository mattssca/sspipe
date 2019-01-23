#!/bin/bash

for sample in `ls /DATA/mdup/*.bam`
do
dir="/DATA/mdup/"
out="/metrics/CollectAlignmentMetrics/"
base=$(basename $sample ".bam")
java -jar picard.jar CollectAlignmentSummaryMetrics \
R=/refseq/GRCh38.fa \
I=${dir}/${base}.bam \
O=${out}/${base}.colalmet.txt
done

