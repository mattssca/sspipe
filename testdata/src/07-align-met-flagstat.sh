#!/bin/bash

for sample in `ls ./testdata/out/mdup/*.bam`
do
dir="./testdata/out/mdup"
out="./testdata/out/metrics/Flagstat/"
base=$(basename $sample ".bam")
samtools flagstat ${dir}/${base}.bam > ${out}/${base}.flagstat.txt
done