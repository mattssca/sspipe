#load packages
library(ggplot2)
library(dplyr)
library(tidyverse)

#read data
metrics = read.csv(file = '../../GIAB/strand-seq/metrics/catmetrics.csv', sep = "\t", header = TRUE)

#subset data
PE = subset(metrics, SE.PE=="PE")
SE = subset(metrics, SE.PE=="SE")

#plot coverage for single end libraries
ggplot(SE, aes(x = reorder(SAMPLE, -COVERAGE), y = SE$COVERAGE)) + 
  geom_histogram(stat = "identity") + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, size = 10)) +
  #geom_text(aes(label=SE$COVERAGE), position=position_dodge(width = 0.2), vjust = 0.5, hjust = -0.1, size = 3, angle = 90) + 
  labs(title = "Strand-Seq Single-end Libraries Coverage", x = "Sample", y = "Coverage (%)")

#plot coverage for paired end libraries
ggplot(PE, aes(x = reorder(SAMPLE, -COVERAGE), y = PE$COVERAGE)) + 
  geom_histogram(stat = "identity", binwidth = 2) + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, size = 5)) +
  #geom_text(aes(label=SE$COVERAGE), position=position_dodge(width = 0.2), vjust = 0.5, hjust = -0.1, size = 3, angle = 90) + 
  labs(title = "Strand-Seq Paired-end Libraries Coverage", x = "Sample", y = "Coverage (%)")



