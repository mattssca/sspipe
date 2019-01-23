#!/bin/bash

for sample in `ls DATA/mdup*.bam`
do
dir="/DATA/mdup"
out="/metrics/flagstat/"
base=$(basename $sample ".bam")
samtools flagstat ${dir}/${base}.bam > ${out}/${base}.flagstat.txt
done