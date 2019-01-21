#load packages
library(dplyr)

#read data
options(digits=9)
ROIlist = read.csv(file = '../../invref/ROI/ROI_locations_allChr.txt', sep = " ", header = TRUE)
ROIlist$callingTh = as.numeric(ROIlist$callingTh)

#subset data
AWC = subset(ROIlist, callingTh == 6)
NAWC = subset(ROIlist, callingTh < 6 )

#select data columns
AWC = AWC %>%
  select(chr, ROIstart, ROIend)

NAWC = NAWC %>%
  select(chr, ROIstart, ROIend)

#export manipoulated ROI files as seperate outputs
write.table(AWC, "../../invref/bed/ROI_AWC.bed", append = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE, quote = FALSE)
write.table(NAWC, "../../invref/bed/ROI_NAWC.bed", append = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE, quote = FALSE)
