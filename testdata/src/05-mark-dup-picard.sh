#!/bin/bash

for sample in `ls ./testdata/out/sorted/*.bam`
do
dir="./testdata/out/sorted/"
out="./testdata/out/mdup/"
metout="./testdata/out/metrics/mdup/"
base=$(basename $sample ".bam")
java -jar ./packages/picard.jar MarkDuplicates \
I=${dir}/${base}.bam \
O=${out}/${base}.mdup.bam \
M=${metout}/${base}.mdup.txt
done