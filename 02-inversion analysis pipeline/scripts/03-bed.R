#load packages
library(dplyr)

#define variables
filtersize = 4e+06
trackcol = "#"

#read data
ROIlist = read.csv(file = 'ROI/ROI_locations_allChr.txt', sep = " ", header = FALSE)

#set variable names
names(ROIlist)[1] <- "index"
names(ROIlist)[2] <- "chr"
names(ROIlist)[3] <- "callThr"
names(ROIlist)[4] <- "start"
names(ROIlist)[5] <- "end"
names(ROIlist)[6] <- "size"
names(ROIlist)[7] <- "deltaWC"
names(ROIlist)[8] <- "reads"

#select data columns
ROIbed = ROIlist %>%
  select(chr, start, end, size, deltaWC)

# filter out events larger than 4MB
ROIbed.filt = subset(ROIbed, size < filtersize)

#export manipoulated ROI files as seperate outputs
write.table(ROIbed.filt, "./ROI/ROI_locations_allChr.filtered.bed", append = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE, quote = FALSE)
