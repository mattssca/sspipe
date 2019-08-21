# load packages
library(plyr)
library(dplyr)
library(tidyverse)
library(data.table)
library(gridExtra)

#set path to file
insample = "../metrics/gc-cov/out/{bedfile}"

# Define run-specs
rundate = "20190819"
runsample = "ERR1429125.mdup.trimmed.counts.bedhg38.1Mb.windows.counts.gc.bed"
platform = "NextSeq"
se_pe = "Paired end"
pdfout = paste0(runsample, ".pdf")

#defiene palette
colpf = "#4C797F"
colpfa = "#71B6BF"
coldup = "#FFC497"

# create a named character vector that relates factor levels to colors.
AlignmentPalette = c(PF_READS=colpf, PF_READS_ALIGNED=colpfa, DUPLICATIONS=coldup)

#read files
gc_cov = read.table(file = insample, header = FALSE)

#change col names
colnames(gc_cov) <- c("Chr", "bin_start", "bin_end","Standarized_Coverage", "GC_content")

#find max value for number of reads per bin
maxreads = max(gc_cov$Standarized_Coverage)

#calculate standarized coverage for each bin
gc_cov[,4] = gc_cov[,4]/maxreads

#transform gc content to negative values for plotting
gc_cov$GC_content[sapply(gc_cov$GC_content, is.numeric)] <- gc_cov$GC_content[sapply(gc_cov$GC_content, is.numeric)] * -1

gc_cov = as.data.frame(gc_cov)

#transform chr variable to factor
gc_cov$Chr = as.factor(gc_cov$Chr)

#subset data
chr1 = filter(gc_cov, Chr == "chr1")
chr2 = filter(gc_cov, Chr == "chr2")
chr3 = filter(gc_cov, Chr == "chr3")
chr4 = filter(gc_cov, Chr == "chr4")
chr5 = filter(gc_cov, Chr == "chr5")
chr6 = filter(gc_cov, Chr == "chr6")
chr7 = filter(gc_cov, Chr == "chr7")
chr8 = filter(gc_cov, Chr == "chr8")
chr9 = filter(gc_cov, Chr == "chr9")
chr10 = filter(gc_cov, Chr == "chr10")
chr11 = filter(gc_cov, Chr == "chr11")
chr12 = filter(gc_cov, Chr == "chr12")
chr13 = filter(gc_cov, Chr == "chr13")
chr14 = filter(gc_cov, Chr == "chr14")
chr15 = filter(gc_cov, Chr == "chr15")
chr16 = filter(gc_cov, Chr == "chr16")
chr17 = filter(gc_cov, Chr == "chr17")
chr18 = filter(gc_cov, Chr == "chr18")
chr19 = filter(gc_cov, Chr == "chr19")
chr20 = filter(gc_cov, Chr == "chr20")
chr21 = filter(gc_cov, Chr == "chr21")
chr22 = filter(gc_cov, Chr == "chr22")
chrX = filter(gc_cov, Chr == "chrX")
chrY = filter(gc_cov, Chr == "chrY")


#remove outlier
chr1 = chr1[-c(144),]

#plot data, chromosome dependently
chr1_plot <- ggplot(chr1) + 
  geom_bar(aes(x = chr1$bin_start, y = chr1$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr1$bin_start, y = chr1$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr1$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr1")

chr2_plot <- ggplot(chr2) + 
  geom_bar(aes(x = chr2$bin_start, y = chr2$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr2$bin_start, y = chr2$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr2$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr2")

chr3_plot <- ggplot(chr3) + 
  geom_bar(aes(x = chr3$bin_start, y = chr3$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr3$bin_start, y = chr3$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr3$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr3")

chr4_plot <- ggplot(chr4) + 
  geom_bar(aes(x = chr4$bin_start, y = chr4$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr4$bin_start, y = chr4$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr4$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr4")

chr5_plot <- ggplot(chr5) + 
  geom_bar(aes(x = chr5$bin_start, y = chr5$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr5$bin_start, y = chr5$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr5$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr5")

chr6_plot <- ggplot(chr6) + 
  geom_bar(aes(x = chr6$bin_start, y = chr6$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr6$bin_start, y = chr6$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr6$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr6")

chr7_plot <- ggplot(chr7) + 
  geom_bar(aes(x = chr7$bin_start, y = chr7$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr7$bin_start, y = chr7$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr7$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr7")

chr8_plot <- ggplot(chr8) + 
  geom_bar(aes(x = chr8$bin_start, y = chr8$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr8$bin_start, y = chr8$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr8$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr8")

chr9_plot <- ggplot(chr9) + 
  geom_bar(aes(x = chr9$bin_start, y = chr9$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr9$bin_start, y = chr9$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr9$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr9")

chr10_plot <- ggplot(chr10) + 
  geom_bar(aes(x = chr10$bin_start, y = chr10$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr10$bin_start, y = chr10$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr10$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr10")

chr11_plot <- ggplot(chr11) + 
  geom_bar(aes(x = chr11$bin_start, y = chr11$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr11$bin_start, y = chr11$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr11$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr11")

chr12_plot <- ggplot(chr12) + 
  geom_bar(aes(x = chr12$bin_start, y = chr12$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr12$bin_start, y = chr12$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr12$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr12")

chr13_plot <- ggplot(chr13) + 
  geom_bar(aes(x = chr13$bin_start, y = chr13$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr13$bin_start, y = chr13$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr13$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr13")

chr14_plot <- ggplot(chr14) + 
  geom_bar(aes(x = chr14$bin_start, y = chr14$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr14$bin_start, y = chr14$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr14$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr14")

chr15_plot <- ggplot(chr15) + 
  geom_bar(aes(x = chr15$bin_start, y = chr15$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr15$bin_start, y = chr15$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr15$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr15")

chr16_plot <- ggplot(chr16) + 
  geom_bar(aes(x = chr16$bin_start, y = chr16$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr16$bin_start, y = chr16$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr16$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr16")

chr17_plot <- ggplot(chr17) + 
  geom_bar(aes(x = chr17$bin_start, y = chr17$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr17$bin_start, y = chr17$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr17$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr17")

chr18_plot <- ggplot(chr18) + 
  geom_bar(aes(x = chr18$bin_start, y = chr18$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr18$bin_start, y = chr18$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr18$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr18")

chr19_plot <- ggplot(chr19) + 
  geom_bar(aes(x = chr19$bin_start, y = chr19$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr19$bin_start, y = chr19$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr19$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr19")

chr20_plot <- ggplot(chr20) + 
  geom_bar(aes(x = chr20$bin_start, y = chr20$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr20$bin_start, y = chr20$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr20$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr20")

chr21_plot <- ggplot(chr21) + 
  geom_bar(aes(x = chr21$bin_start, y = chr21$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr21$bin_start, y = chr21$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr21$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr21")

chr22_plot <- ggplot(chr22) + 
  geom_bar(aes(x = chr22$bin_start, y = chr22$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chr22$bin_start, y = chr22$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chr22$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("Chr22")

chrX_plot <- ggplot(chrX) + 
  geom_bar(aes(x = chrX$bin_start, y = chrX$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chrX$bin_start, y = chrX$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_fill_manual(name = "Legend", breaks=c(1,2), labels=c("hej", "hello")) +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chrX$bin_end), 20000000)) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  labs(x = "Position", y = "Fraction") +
  ggtitle("ChrX")

chrY_plot <- ggplot(chrY) + 
  geom_bar(aes(x = chrY$bin_start, y = chrY$Standarized_Coverage), fill = colpf, stat = "identity", position = "dodge") +
  geom_bar(aes(x = chrY$bin_start, y = chrY$GC_content), fill = coldup,  stat = "identity", position = "dodge") +
  scale_y_continuous(breaks=seq(-1.0, 1.0, 0.1), limits = c(-0.6, 0.35)) +
  scale_x_continuous(breaks=seq(0, max(chrX$bin_end), 20000000)) +
  scale_fill_manual(name = "Legend", breaks=c(1,2), labels=c("hej", "hello")) +
  theme(plot.title = element_text(hjust = 0.5), axis.title.x = element_blank(), axis.title.y = element_blank()) +
  ggtitle("ChrY")
  
  chrY_plot

legend = ggplot

GC_Coverage_plot = grid.arrange(chr1_plot, chr2_plot, chr3_plot, chr4_plot, chr5_plot, chr6_plot, chr7_plot, chr8_plot, chr9_plot, chr10_plot, chr11_plot, chr12_plot, chr13_plot, chr14_plot, chr15_plot, chr16_plot, chr17_plot, chr18_plot, chr19_plot, chr20_plot, chr21_plot, chr22_plot, chrX_plot, nrow = 5, ncol = 5, name = "Standarized Coverage and GC content", top = paste0("Standarized Coverage (teal) and GC content (orange) | ", rundate," | ", runsample," | ", platform," | ", se_pe), bottom = "Position (1Mb windows/bin)", left = "Fraction", layout_matrix = rbind(c(1,2,3,4,5), c(6,7,8,9,10), c(11,12,13,14,15), c(16,17,18,19,20), c(21,22,23,24,25)))

# export plot as pdf 
ggsave(pdfout, 
       GC_Coverage_plot,
       path = "../../",
       limitsize = FALSE,
       scale = 1, 
       width = 50,
       height = 20, 
       units = c("in"),
       dpi = 300)
