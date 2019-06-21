#!/bin/bash

for sample in `ls ./DATA/sorted/*.bam`
do
dir="./DATA/sorted/"
dirout="./DATA/mdup/"
out="./metrics/mdup/"
base=$(basename $sample ".bam")
java -jar '/home/mattsada/packages/picard-2.18.11/picard.jar' MarkDuplicates \
I= ${dir}/${base}.bam \
#USE_JDK_DEFLATER=TRUE fiixes deflater java related error on macos
O= ${dirout}/${base}.mdup.bam \
M= ${out}/${base}.mdup.txt
done
