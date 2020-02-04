#!/usr/bin/env Rscript

library(plyr)
library(dplyr)
library(tidyverse)
library(data.table)
library(gridExtra)

# Define run-specs
rundate = Sys.Date()
runsample = "Test data-set"
platform = "Strand-Seq"
se_pe = "Paired end"
pdfout = paste0(runsample, ".pdf")

#defiene palette
colpf = "#4C797F"
colpfa = "#71B6BF"
coldup = "#FFC497"

# create a named character vector that relates factor levels to colors.
AlignmentPalette = c(PF_READS=colpf, PF_READS_ALIGNED=colpfa, DUPLICATIONS=coldup)

#set path to file
insample1 = "./testdata/out/metrics/gc-cov/ERR1429118-chr16.sorted.mdup.counts.bedhg38.1Mb.windows.counts.gc.bed"

#read files
gc_cov1 = read.table(file = insample1, header = FALSE)

#change col names
colnames(gc_cov1) <- c("Chr", "bin_start", "bin_end","Standarized_Coverage", "GC_content")

#find max value for number of reads per bin
maxreads1 = max(gc_cov1$Standarized_Coverage)

#calculate standarized coverage for each bin
gc_cov1[,4] = gc_cov1[,4]/maxreads1

#transform gc content to negative values for plotting
gc_cov1$GC_content[sapply(gc_cov1$GC_content, is.numeric)] <- gc_cov1$GC_content[sapply(gc_cov1$GC_content, is.numeric)] * -1

gc_cov1 = as.data.frame(gc_cov1)

#transform chr variable to factor
gc_cov1$Chr = as.factor(gc_cov1$Chr)

#subset data
chr161 = filter(gc_cov1, Chr == "chr16")

#plot data, chromosome dependently
chr16_plot_1 <- ggplot(chr161) + 
  geom_bar(aes(x = chr161$bin_start, y = chr161$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr161$bin_start, y = chr161$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr161$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("ERR1429118 - Chr16")

#set path to file
insample2 = "./testdata/out/metrics/gc-cov/ERR1429122-chr16.sorted.mdup.counts.bedhg38.1Mb.windows.counts.gc.bed"

#read files
gc_cov2 = read.table(file = insample2, header = FALSE)

#change col names
colnames(gc_cov2) <- c("Chr", "bin_start", "bin_end","Standarized_Coverage", "GC_content")

#find max value for number of reads per bin
maxreads2 = max(gc_cov2$Standarized_Coverage)

#calculate standarized coverage for each bin
gc_cov2[,4] = gc_cov2[,4]/maxreads2

#transform gc content to negative values for plotting
gc_cov2$GC_content[sapply(gc_cov2$GC_content, is.numeric)] <- gc_cov2$GC_content[sapply(gc_cov2$GC_content, is.numeric)] * -1

gc_cov2 = as.data.frame(gc_cov2)

#transform chr variable to factor
gc_cov2$Chr = as.factor(gc_cov2$Chr)

#subset data
chr162 = filter(gc_cov2, Chr == "chr16")

#plot data, chromosome dependently
chr16_plot_2 <- ggplot(chr162) + 
  geom_bar(aes(x = chr162$bin_start, y = chr162$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr162$bin_start, y = chr162$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr162$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("ERR1429122 - Chr16")

#set path to file
insample3 = "./testdata/out/metrics/gc-cov/ERR1429134-chr16.sorted.mdup.counts.bedhg38.1Mb.windows.counts.gc.bed"

#read files
gc_cov3 = read.table(file = insample3, header = FALSE)

#change col names
colnames(gc_cov3) <- c("Chr", "bin_start", "bin_end","Standarized_Coverage", "GC_content")

#find max value for number of reads per bin
maxreads3 = max(gc_cov3$Standarized_Coverage)

#calculate standarized coverage for each bin
gc_cov3[,4] = gc_cov3[,4]/maxreads3

#transform gc content to negative values for plotting
gc_cov3$GC_content[sapply(gc_cov3$GC_content, is.numeric)] <- gc_cov3$GC_content[sapply(gc_cov3$GC_content, is.numeric)] * -1

gc_cov3 = as.data.frame(gc_cov3)

#transform chr variable to factor
gc_cov3$Chr = as.factor(gc_cov3$Chr)

#subset data
chr163 = filter(gc_cov3, Chr == "chr16")

#plot data, chromosome dependently
chr16_plot_3 <- ggplot(chr163) + 
  geom_bar(aes(x = chr163$bin_start, y = chr163$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr163$bin_start, y = chr163$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr163$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("ERR1429134 - Chr16")

#set path to file
insample4 = "./testdata/out/metrics/gc-cov/ERR1429150-chr16.sorted.mdup.counts.bedhg38.1Mb.windows.counts.gc.bed"

#read files
gc_cov4 = read.table(file = insample4, header = FALSE)

#change col names
colnames(gc_cov4) <- c("Chr", "bin_start", "bin_end","Standarized_Coverage", "GC_content")

#find max value for number of reads per bin
maxreads4 = max(gc_cov4$Standarized_Coverage)

#calculate standarized coverage for each bin
gc_cov4[,4] = gc_cov4[,4]/maxreads4

#transform gc content to negative values for plotting
gc_cov4$GC_content[sapply(gc_cov4$GC_content, is.numeric)] <- gc_cov4$GC_content[sapply(gc_cov4$GC_content, is.numeric)] * -1

gc_cov4 = as.data.frame(gc_cov4)

#transform chr variable to factor
gc_cov4$Chr = as.factor(gc_cov4$Chr)

#subset data
chr164 = filter(gc_cov4, Chr == "chr16")

#plot data, chromosome dependently
chr16_plot_4 <- ggplot(chr164) + 
  geom_bar(aes(x = chr164$bin_start, y = chr164$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr164$bin_start, y = chr164$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr164$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("ERR1429150 - Chr16")

#set path to file
insample5 = "./testdata/out/metrics/gc-cov/ERR1429171-chr16.sorted.mdup.counts.bedhg38.1Mb.windows.counts.gc.bed"

#read files
gc_cov5 = read.table(file = insample5, header = FALSE)

#change col names
colnames(gc_cov5) <- c("Chr", "bin_start", "bin_end","Standarized_Coverage", "GC_content")

#find max value for number of reads per bin
maxreads5 = max(gc_cov5$Standarized_Coverage)

#calculate standarized coverage for each bin
gc_cov5[,4] = gc_cov5[,4]/maxreads5

#transform gc content to negative values for plotting
gc_cov5$GC_content[sapply(gc_cov5$GC_content, is.numeric)] <- gc_cov5$GC_content[sapply(gc_cov5$GC_content, is.numeric)] * -1

gc_cov5 = as.data.frame(gc_cov5)

#transform chr variable to factor
gc_cov5$Chr = as.factor(gc_cov5$Chr)

#subset data
chr165 = filter(gc_cov5, Chr == "chr16")

#plot data, chromosome dependently
chr16_plot_5 <- ggplot(chr165) + 
  geom_bar(aes(x = chr165$bin_start, y = chr165$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr165$bin_start, y = chr165$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr165$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("ERR1429171 - Chr16")

GC_Coverage_plot = grid.arrange(chr16_plot_1, chr16_plot_2, chr16_plot_3, chr16_plot_4, chr16_plot_5, nrow = 5, ncol = 1, name = "Standarized Coverage and GC content", top = paste0("Standarized Coverage (teal) and GC content (orange) | ", rundate," | ", runsample," | ", platform," | ", se_pe), bottom = "Position (1Mb windows/bin)", left = "Fraction", layout_matrix = rbind(c(1), c(2), c(3), c(4), c(5)))

# export plot as pdf 
ggsave("gc-cov-plot.pdf", 
       GC_Coverage_plot,
       path = "./testdata/out/metrics/",
       width = 20,
       height = 15,
       limitsize = TRUE,
       units = c("in"),
       dpi = 300)