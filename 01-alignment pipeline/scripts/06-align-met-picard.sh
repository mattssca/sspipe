#!/bin/bash

for sample in `ls /home/mattsada/Desktop/GIAB/strand-seq/DATA/mdup/*.bam`
do
dir="/home/mattsada/Desktop/GIAB/strand-seq/DATA/mdup/"
base=$(basename $sample ".bam")
bowtie2 -x '/home/mattsada/Desktop/alignmentpipe/data/refseq/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index' -1 ${dir}/${base}_1.fastq -2 ${dir}/${base}_2.fastq -S ${dir}/${base}.sam
java -jar picard.jar CollectAlignmentSummaryMetrics \
R=/home/mattsada/Desktop/alignmentpipe/data/refseq/GRCh38.fa \
I=${dir}/${base}.bam \
O=${dir}/${base}.txt
done

