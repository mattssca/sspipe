#!/bin/bash

for sample in `ls ./pre/lib/*.bam`
do
dir="./pre/lib/"
basein=$(basename $sample ".bam")
baseout=$(basename $sample ".bai")
samtools index  ${dir}/${basein}.bam > ${dir}/${baseout}.bai
done
