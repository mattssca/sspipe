# load packages
library(dplyr)
library(tidyverse)
library(data.table)

# Defining variables
genomesize = as.numeric("3099706404")

#set path to directory
setwd("./Desktop/tmp/dup-up/")

## Mark duplicates
# List all txt files including sub-folders
mdup.list = list.files(path = "./mdup/", 
                       recursive = TRUE,
                       pattern = "\\.txt$", 
                       full.names = TRUE)

# Read all the files and create a ID column to store filenames
mdup = rbindlist(sapply(mdup.list, 
                        fread, 
                        simplify = FALSE),
                 use.names = TRUE, 
                 idcol = "ID" )

# Keep only filenames (not full path in ID varaible)
mdup[, ID := factor(ID, labels = basename(mdup.list))]

# Remove extensions (filename)
mdup$ID = gsub("\\..*", "", mdup$ID)

# Remove columns
mdup = select(mdup, -c(LIBRARY))


##CollectAlignmentMetrics
# List all txt files including sub-folders
colal.list = list.files(path = "./CollectAlignmentMetrics/", 
                        recursive = TRUE,
                        pattern = "\\.txt$", 
                        full.names = TRUE)

# Read all the files and create a ID column to store filenames
colal = rbindlist(sapply(colal.list, 
                         fread, 
                         simplify = FALSE),
                  use.names = TRUE, 
                  idcol = "ID" )

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
                                              UNMAPPED_READS, 
                                              PF_READS, 
                                              PCT_PF_READS, 
                                              PF_READS_ALIGNED, 
                                              PCT_PF_READS_ALIGNED, 
                                              READ_PAIR_DUPLICATES, 
                                              UNPAIRED_READ_DUPLICATES, 
                                              PERCENT_DUPLICATION, 
                                              PCT_ADAPTER, ESTIMATED_LIBRARY_SIZE))

# Convert data.frame to numeric matrix
alignmentMetrics[2:12] <- lapply(alignmentMetrics[2:12], as.numeric)

# Additional calculations and summaries
alignmentMetrics = alignmentMetrics %>%
  bind_rows(summarise_all(alignmentMetrics, funs(if(is.numeric(.)) sum(.) else "Total"))) %>%
  bind_rows(summarise_all(alignmentMetrics, funs(if(is.numeric(.)) mean(.) else "Mean")))

# Calculate duplication rates
alignmentMetrics$DUPLICATIONS <- ((alignmentMetrics$READ_PAIR_DUPLICATES*2) + alignmentMetrics$UNPAIRED_READ_DUPLICATES)
alignmentMetrics$UNIQUE_READS <- ((alignmentMetrics$PF_READS_ALIGNED - alignmentMetrics$DUPLICATIONS))
                                                 
# Calculate coverage
## coverage (duplicate reads not included)
alignmentMetrics = within(alignmentMetrics, PCT_COVERAGE_NO_DUPLICATES <- (alignmentMetrics$UNIQUE_READS * alignmentMetrics$MEAN_READ_LENGTH)/genomesize)

## coverage (duplications included)
alignmentMetrics = within(alignmentMetrics, PCT_COVERAGE_DUPLICATES <- (alignmentMetrics$PF_READS_ALIGNED * alignmentMetrics$MEAN_READ_LENGTH)/genomesize)

# Export alignment metrics as data table for further characterization and visualization
write.table(x = alignmentMetrics, file = "./alignmentmetrics.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = TRUE)
