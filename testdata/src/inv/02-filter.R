#!/usr/bin/env Rscript

#load packages
library(dplyr)

#define variables
filtersize = 4e+06
trackcol = "#"

#read data
ROIlist = read.csv(file = 'testdata/out/invertR/ROI_locations_Table_b50_chr16.txt', sep = " ", header = TRUE)

# filter out events larger than 4MB
ROIbed.filt = subset(ROIlist, ROIlist$ROIsize < filtersize)

filtout = (nrow(ROIlist) - nrow(ROIbed.filt))

paste0("Only keep variants > ", filtersize)
paste0("Number of variants removed: ", filtout)

ROIbed = ROIbed.filt %>%
  select(chr, ROIstart, ROIend, deltaWC)

#export manipoulated ROI files as seperate outputs
write.table(ROIbed, "testdata/out/invertR/refinement/testdata-chr16-GRCh38-filt-invCalls.bed", append = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE, quote = FALSE)

