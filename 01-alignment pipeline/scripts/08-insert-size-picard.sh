#!/bin/bash

for sample in `ls ./DATA/mdup/*.bam`
do
dir="./DATA/mdup/"
out="./metrics/CollectInsertSizeMetrics/"
base=$(basename $sample ".bam")
java -jar '/Users/mattsada/packages/picard/build/libs/picard.jar' picard.jar CollectInsertSizeMetrics \
I=${dir}/${base}.bam \
O=${out}/${base}.colinsert.txt \
H=${out}/${base}.insert_size_histogram.pdf \
M=0.5
done