#!/usr/bin/env Rscript

#load packages
library(dplyr)

#read data
ROIlist.final = read.csv(file = 'testdata/out/invertR/refinement/testdata-chr16-GRCh38-filt-sort-merged-ci10kb-invCalls.bed', sep = "\t", header = FALSE)

# remove events with no additional support
ROIlist.final.single = subset(ROIlist.final, V4 > 1 )

#select data columns
ROIlist.final.single = ROIlist.final.single %>%
  select(V1, V2, V3)

#export manipoulated ROI files bed formatted file for UCSC genome browser
write.table(ROIlist.final.single, "testdata/out/invertR/refinement/testdata-chr16-GRCh38-filt-sort-merged-ci10kb-invCalls-nosing.bed", append = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE, quote = FALSE)