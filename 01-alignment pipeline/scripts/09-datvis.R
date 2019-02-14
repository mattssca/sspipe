#load packages
library(ggplot2)
library(dplyr)
library(tidyverse)
library(reshape2)

# read data
alignmet = read.csv(file = '../mattsada/Desktop/tmp/metpipe/metric/alignmentmetrics.txt', sep = "\t", header = TRUE)

# subset data (ommit total and mean values)
remove.list <- paste(c("Total", "Mean"), collapse = '|') 
filt_alignmet = alignmet %>% filter(!grepl(remove.list, ID)) 

# format percentage value
filt_alignmet$PCT_COVERAGE = filt_alignmet$PCT_COVERAGE * 100
filt_alignmet$PERCENT_DUPLICATION = filt_alignmet$PERCENT_DUPLICATION * 100
filt_alignmet$PCT_PF_READS = filt_alignmet$PCT_PF_READS * 100
filt_alignmet$PCT_PF_READS_ALIGNED = filt_alignmet$PCT_PF_READS_ALIGNED * 100
filt_alignmet$PCT_ADAPTER = filt_alignmet$PCT_ADAPTER * 100

# defining variables
mean_cov <- mean(filt_alignmet$PCT_COVERAGE)

# plot coverage for all libraries
ggplot(filt_alignmet, aes(x = reorder(ID, -ID), y = filt_alignmet$PCT_COVERAGE)) + 
  geom_histogram(stat = "identity", fill = 'seagreen1', color = 'gray17') + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, size = 10)) +
  labs(title = "Strand-SeqLibraries", x = "Sample", y = "Coverage (%)") 

# plot pct_dulpications for all libraries
ggplot(filt_alignmet, aes(x = reorder(ID, -ID), y = filt_alignmet$PERCENT_DUPLICATION)) + 
  geom_histogram(stat = "identity", fill = 'seagreen1', color = 'gray17') + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, size = 10)) +
  labs(title = "Strand-Seq Libraries", x = "Sample", y = "Duplications (%)")

# subset reads 
alignment_reads = select(alignmentMetrics, c(ID, TOTAL_READS, UNMAPPED_READS, PF_READS, PF_READS_ALIGNED, READ_PAIR_DUPLICATES))
alignment_reads = alignment_reads %>% filter(!grepl(remove.list, ID)) 

# plot total number of PF reads (total/aligned)
ggplot(alignment_reads, aes(x=ID)) +
  geom_bar(aes(y=PF_READS), width = 0.4, stat = "identity", position ="identity", alpha = 1, fill = 'tomato3', color = 'gray17') +
  geom_bar(aes(y=PF_READS_ALIGNED), width = 0.4, stat = "identity", position = "identity", alpha = 1, fill = 'seagreen1', color = 'gray17') +
  geom_bar(aes(y=READ_PAIR_DUPLICATES), width = 0.4, stat = "identity", position = "identity", alpha = 0.5, fill = 'lightpink4', color = 'gray17') +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, size = 10)) +
  labs(title = "PF reads, PF aligned reads and read-pair duplicates", x = "Sample", y = "Reads")
