#!/usr/bin/env Rscript

library(reshape2)
library(scales)
library(ggplot2)
library(ggthemes)
library(gridExtra)
library(gtable)
library(dplyr)
library(kableExtra)

# Define run-specs
rundate = Sys.Date()
runsample = "NA12878"
platform = "Strand-Seq"
se_pe = "Paired end"
runcomments = "Test data-set"

############# Read data and data manipulation #############
# read data
alignmet = read.csv(file = './testdata/out/metrics/alignmentmetrics.txt', sep = "\t", header = TRUE)

# subset data (ommit total and mean values)
remove.list <- paste(c("Total", "Mean"), collapse = '|') 
filt_alignmet = alignmet %>% filter(!grepl(remove.list, ID)) 

# format percentage value
filt_alignmet$PCT_COVERAGE = filt_alignmet$PCT_COVERAGE_NO_DUPLICATES * 100
filt_alignmet$PERCENT_DUPLICATION = filt_alignmet$PERCENT_DUPLICATION * 100
filt_alignmet$PCT_PF_READS = filt_alignmet$PCT_PF_READS * 100
filt_alignmet$PCT_PF_READS_ALIGNED = filt_alignmet$PCT_PF_READS_ALIGNED * 100
filt_alignmet$PCT_ADAPTER = filt_alignmet$PCT_ADAPTER * 100

# subset alignment data
up_align = select(filt_alignmet, c(ID, PF_READS, PF_READS_ALIGNED, DUPLICATIONS))
up_align = up_align %>% filter(!grepl(remove.list, ID)) 

# defining mean values
mean_pfreads <- mean(filt_alignmet$PF_READS)
mean_pfreadsal <- mean(filt_alignmet$PF_READS_ALIGNED)
mean_dup <- mean(filt_alignmet$DUPLICATIONS)
mean_cov <- mean(filt_alignmet$PCT_COVERAGE)

# setting colors
colpf = "#4C797F"
colpfa = "#71B6BF"
coldup = "#FFC497"

## alignment summary
# melt data frame
melt_met = melt(up_align, id.var="ID", variable.name="Type")

# define variable names
melt_met$Type = factor(as.character(melt_met$Type), 
                       levels=c("PF_READS", "PF_READS_ALIGNED", "DUPLICATIONS"))

# reorder samples
melt_met = melt_met %>% arrange(ID)

# create a named character vector that relates factor levels to colors.
AlignmentPalette = c(PF_READS=colpf, PF_READS_ALIGNED=colpfa, DUPLICATIONS=coldup)

## coverage summary
# create data.frame
coverage_table = select(filt_alignmet, c(ID, PCT_COVERAGE))

# round coverage pct values to two digits
coverage_table = coverage_table %>% mutate_at(vars(PCT_COVERAGE), funs(round(., 1)))

## duplication rates
# create data.frame
duplications_table = select(filt_alignmet, c(ID, PERCENT_DUPLICATION))

# round coverage pct values to two digits
duplications_table = duplications_table %>% mutate_at(vars(PERCENT_DUPLICATION), funs(round(.)))

# calculate mean duplication rate
mean_duprate = mean(duplications_table$PERCENT_DUPLICATION)

############# plotting #############
# plot alignment data
alignment_plot = ggplot(melt_met, aes(x = ID, y = value, fill = Type)) +
  geom_bar(position = "dodge", stat = "identity") +
  theme(legend.position = "top", axis.text.x = element_text(angle = 90, vjust = 0.5), panel.grid.minor = element_line(color = "black", linetype = "solid"), panel.grid.major = element_blank(), panel.background = element_blank(), plot.margin = unit(c(1,5,1,2), "lines")) +
  scale_y_continuous(labels = scientific) +
  labs(title = "1. Alignment summary", x = "Sample", y = "Reads") +
  scale_fill_manual(values=AlignmentPalette) 

alignment_plot

# plot coverage summary
coverage_plot = ggplot(data = coverage_table, aes(x = coverage_table$ID, y = coverage_table$PCT_COVERAGE, group = 1, label = coverage_table$PCT_COVERAGE)) +
  theme(legend.position = "top", axis.ticks = element_blank(), axis.text.x = element_blank(), panel.grid.minor = element_line(color = "black", linetype = "solid"), panel.grid.major = element_blank(), panel.background = element_blank(), plot.margin = unit(c(1,5,1,2), "lines")) +
  labs(title = "2. Genomic Coverage", x = "Sample", y = "Coverage") +
  geom_bar(stat = "identity", fill = colpfa) + 
  geom_hline(yintercept = mean_cov, color=coldup, linetype="dashed")

coverage_plot

# plot duplication rates
duplications_dist_plot = ggplot(data = duplications_table, aes(x = duplications_table$ID, y = duplications_table$PERCENT_DUPLICATION, group = 1, label = duplications_table$PERCENT_DUPLICATION)) +
  theme(legend.position = "top", axis.ticks = element_blank(), axis.text.x = element_blank(), panel.grid.minor = element_line(color = "black", linetype = "solid"), panel.grid.major = element_blank(), panel.background = element_blank(), plot.margin = unit(c(1,5,1,2), "lines")) +
  labs(title = "3. Duplication Percentage", x = "Sample", y = "Duplication") +
  geom_bar(stat = "identity", fill = colpfa) + 
  geom_hline(yintercept = mean_duprate, color=coldup, linetype="dashed")

duplications_dist_plot

############# merge all plots/data table and export as .pdf #############
# create grid.arrange object
Alignment_QC = grid.arrange(alignment_plot, coverage_plot, duplications_dist_plot, nrow = 5, ncol = 4, name = "Quality Report", top = paste0("Quality Report | ", rundate," | ", runsample," | ", platform," | ", se_pe," | ", runcomments), bottom = "Page 1", layout_matrix = rbind(c(1,1,1,1), c(1,1,1,1), c(1,1,1,1), c(2,2,3,3), c(2,2,3,3)))

# export plot as pdf 
ggsave("alignment_qc.pdf", 
       Alignment_QC,
       path = "./testdata/out/metrics/",
       limitsize = TRUE,
       units = c("in"),
       dpi = 300)