#!/bin/bash

for sample in `ls ./testdata/out/mdup/*.bam`
do
dir="./testdata/out/mdup/"
out="./testdata/out/metrics/CollectInsertSizeMetrics/"
base=$(basename $sample ".bam")
java -jar ./packages/picard.jar CollectInsertSizeMetrics \
I=${dir}/${base}.bam \
O=${out}/${base}.colinsert.txt \
H=${out}/${base}.insert_size_histogram.pdf \
M=0.5
done