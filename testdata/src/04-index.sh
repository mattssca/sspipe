#!/bin/bash

for sample in `ls ./testdata/out/mdup/*.bam`
do
dir="./testdata/out/mdup/"
basein=$(basename $sample ".bam")
baseout=$(basename $sample ".bai")
samtools index  ${dir}/${basein}.bam > ${dir}/${baseout}.bai
done