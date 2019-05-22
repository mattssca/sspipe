#load packages
library(dplyr)

#read data
inv.profile = read.csv(file = 'ROI/ROI_locations_allChr.filtered.sorted.mergedcount.nosing.bed', sep = "\t", header = FALSE)
