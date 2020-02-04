#!/bin/bash

for sample in `ls ./testdata/out/mdup/*.bam`
do
dir="./testdata/out/mdup/"
out="./testdata/out/metrics/CollectGCBiasMetrics/"
base=$(basename $sample ".bam")
java -jar ./packages/picard.jar CollectGcBiasMetrics \
I=${dir}/${base}.bam \
O=${out}/${base}.gc_bias_metrics.txt \
CHART=${out}/${base}.gc_bias_metrics.pdf \
S=${out}/${base}.summary_metrics.txt \
R=./testdata/chr16-ref/GRCh38-chr16.fasta
done