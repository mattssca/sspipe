#!/bin/bash

sh ./testdata/src/01-pe-bowtie2-align.sh
sh ./testdata/src/02-sam2bam.sh
sh ./testdata/src/03-bamsort.sh
sh ./testdata/src/04-index.sh
sh ./testdata/src/05-mark-dup-picard.sh
sh ./testdata/src/06-align-met-picard.sh
sh ./testdata/src/07-align-met-flagstat.sh
sh ./testdata/src/08-insert-size-picard.sh
sh ./testdata/src/09-gc-bias-picard.sh
sh ./testdata/src/11-gccov-bedtools.sh
R CMD BATCH ./testdata/src/12-gccov-plot.R
R CMD BATCH ./testdata/src/13-dataman.R
R CMD BATCH ./testdata/src/14-datavis.R
sh ./testdata/src/inv/inv-master.sh