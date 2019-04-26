#!/bin/bash

for sample in `ls ./DATA/mdup/*.bam`
do
dir="./DATA/mdup/"
out="./metrics/CollectGCBiasMetrics/"
out2="./figs/CollectGCBiasMetrics/"
base=$(basename $sample ".bam")
java -jar picard.jar CollectGcBiasMetrics \
I=${dir}/${base}.bam \
O=${out}/${base}.gc_bias_metrics.txt \
CHART=${out2}/${base}gc_bias_metrics.pdf \
S=${out}/${base}.summary_metrics.txt \
R=./refseq/hg38.fa
done
