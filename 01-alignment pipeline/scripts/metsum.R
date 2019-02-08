# load packages
library(dplyr)
library(tidyverse)
library(data.table)

## Mark duplicates
# List all txt files including sub-folders
mdup.list = list.files(path = "../mattsada/Desktop/tmp/metpipe/metric/mdup/", recursive = TRUE,
                            pattern = "\\.txt$", full.names = TRUE)

  # Read all the files and create a ID column to store filenames
mdup = rbindlist(sapply(mdup.list, fread, simplify = FALSE),
                 use.names = TRUE, idcol = "ID" )

  # Keep only filenames (not full path in ID varaible)
mdup[, ID := factor(ID, labels = basename(mdup.list))]

  # Remove extensions (filename)
mdup$ID = gsub("\\..*", "", mdup$ID)

  # Remove columns
mdup = select(mdup, -c(LIBRARY))


##CollectAlignmentMetrics
# List all txt files including sub-folders
colal.list = list.files(path = "../mattsada/Desktop/tmp/metpipe/metric/colalign/", recursive = TRUE,
                        pattern = "\\.txt$", full.names = TRUE)

  # Read all the files and create a ID column to store filenames
colal = rbindlist(sapply(colal.list, fread, simplify = FALSE),
                  use.names = TRUE, idcol = "ID" )

  # Keep only filenames (not full path in ID varaible)
colal[, ID := factor(ID, labels = basename(colal.list))]

  # Remove extensions (filename)
colal$ID = gsub("\\..*", "", colal$ID)

  # Only select paired infomation
colal = filter(colal, CATEGORY == "PAIR")

# Data joining
alignmentMetrics = inner_join(mdup, colal, by = c("ID","ID"))

# Select columns
alignmentMetrics = select(alignmentMetrics, c(ID, 
                                              MEAN_READ_LENGTH,
                                              TOTAL_READS,
                                              PF_READS_ALIGNED, 
                                              PCT_PF_READS_ALIGNED,
                                              UNMAPPED_READS,
                                              PF_READS, 
                                              PCT_PF_READS, 
                                              PCT_ADAPTER))

# Additional calculations and summaries


# Export alignment metrics as data table for further characterization and visualization
write.table(x = alignmentMetrics, file = "../mattsada/Desktop/tmp/metpipe/metric/alignmentmetrics.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = TRUE)
