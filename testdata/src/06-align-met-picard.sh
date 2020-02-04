#!/bin/bash

for sample in `ls ./testdata/out/mdup/*.bam`
do
dir="./testdata/out/mdup/"
out="./testdata/out/metrics/CollectAlignmentMetrics/"
base=$(basename $sample ".bam")
java -jar ./packages/picard.jar CollectAlignmentSummaryMetrics \
R=./testdata/chr16-ref/GRCh38-chr16.fasta \
I=${dir}/${base}.bam \
O=${out}/${base}.colalmet.txt
done