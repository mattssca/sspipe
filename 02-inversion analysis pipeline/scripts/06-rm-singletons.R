#load packages
library(dplyr)

#read data
ROIlist.final = read.csv(file = 'ROI/ROI_locations_allChr.filtered.sorted.mergedcount.bed', sep = "\t", header = FALSE)

# remove events with no additional support
ROIlist.final.single = subset(ROIlist.final, V4 > 1 )

#select data columns
ROIlist.final.single = ROIlist.final.single %>%
  select(V1, V2, V3)

#export manipoulated ROI files bed formatted file for UCSC genome browser
write.table(ROIlist.final.single, "./ROI/ROI_locations_allChr.filtered.sorted.mergedcount.nosing.bed", append = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE, quote = FALSE)