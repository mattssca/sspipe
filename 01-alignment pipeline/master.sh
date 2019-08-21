#!/bin/bash

./01-alignment\ pipeline/scripts/01-pe-bowtie2-align.sh
./01-alignment\ pipeline/scripts/02-sam2bam.sh
./01-alignment\ pipeline/scripts/03-bamsort.sh
./01-alignment\ pipeline/scripts/04-mark-dup-picard.sh
./01-alignment\ pipeline/scripts/05-index.sh
./01-alignment\ pipeline/scripts/06-align-met-picard.sh
./01-alignment\ pipeline/scripts/07-align-met-flagstat.sh
./01-alignment\ pipeline/scripts/08-insert-size-picard.sh
./01-alignment\ pipeline/scripts/09-gc-bias-picard.sh
#./01-alignment\ pipeline/scripts/10-trim-samtools.sh
#./01-alignment\ pipeline/scripts/11-gccov-bedtools.sh
# Rscript ./01-alignment\ pipeline/scripts/12-gc-cov-plot.R
Rscript ./01-alignment\ pipeline/scripts/13-dataman.R
Rscript ./01-alignment\ pipeline/scripts/14-datavis.R
#./01-alignment\ pipeline/scripts/15-BAIT.sh
