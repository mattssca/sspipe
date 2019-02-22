library(reshape2)
library(scales)
library(ggthemes)
library(gridExtra)
library(tableGrob)
library(kableExtra)

############# Read data and data manipulation #############
  # read data
  alignmet = read.csv(file = '../mattsada/Desktop/tmp/alignmentmetrics.txt', sep = "\t", header = TRUE)

  # subset data (ommit total and mean values)
  remove.list <- paste(c("Total", "Mean"), collapse = '|') 
  filt_alignmet = alignmet %>% filter(!grepl(remove.list, ID)) 

  # format percentage value
  filt_alignmet$PCT_COVERAGE = filt_alignmet$PCT_COVERAGE * 100
  filt_alignmet$PERCENT_DUPLICATION = filt_alignmet$PERCENT_DUPLICATION * 100
  filt_alignmet$PCT_PF_READS = filt_alignmet$PCT_PF_READS * 100
  filt_alignmet$PCT_PF_READS_ALIGNED = filt_alignmet$PCT_PF_READS_ALIGNED * 100
  filt_alignmet$PCT_ADAPTER = filt_alignmet$PCT_ADAPTER * 100

  # subset alignment data
  up_align = select(filt_alignmet, c(ID, PF_READS, PF_READS_ALIGNED, READ_PAIR_DUPLICATES))
  up_align = up_align %>% filter(!grepl(remove.list, ID)) 

  # defining mean values
  mean_pfreads <- mean(filt_alignmet$PF_READS)
  mean_pfreadsal <- mean(filt_alignmet$PF_READS_ALIGNED)
  mean_dup <- mean(filt_alignmet$READ_PAIR_DUPLICATES)

  # setting colors
  colpf = "#4C797F"
  colpfa = "#71B6BF"
  coldup = "#FFC497"

  ## alignment summary
  # melt data frame
  melt_met = melt(up_align, id.var="ID", variable.name="Type")
  
  # define variable names
  melt_met$Type = factor(as.character(melt_met$Type), 
                         levels=c("PF_READS", "PF_READS_ALIGNED", "READ_PAIR_DUPLICATES"))
  
  # create a named character vector that relates factor levels to colors.
  AlignmentPalette = c(PF_READS=colpf, PF_READS_ALIGNED=colpfa, READ_PAIR_DUPLICATES=coldup)
  
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
    geom_bar(position = "dodge", stat = "identity", color = "black") +
    theme(legend.position = "top", axis.text.x = element_text(angle = 90, vjust = 0.5), panel.grid.minor = element_line(color = "black", linetype = "solid"), panel.grid.major = element_blank(), panel.background = element_blank(), plot.margin = unit(c(2,5,0,1), "lines")) +
    scale_y_continuous(labels = scientific) +
    labs(title = "Alignment summary", x = "Sample", y = "Reads") +
    scale_fill_manual(values=AlignmentPalette) 
    
  # plot coverage summary 1
  coverage_plot = ggplot(data = coverage_table, aes(x = coverage_table$ID, y = coverage_table$PCT_COVERAGE, group = 1, label = coverage_table$PCT_COVERAGE)) +
    geom_smooth(aes (x = coverage_table$ID, y = coverage_table$PCT_COVERAGE, group = 1), stat = "identity", color = coldup, linetype = "solid", size = 1) +
    theme(legend.position = "top", axis.text.x = element_text(angle = 90, vjust = 0.5), panel.grid.minor = element_line(color = "black", linetype = "solid"), panel.grid.major = element_blank(), panel.background = element_blank(), plot.margin = unit(c(2,5,0,1), "lines")) +
    labs(title = "Coverage summary", x = "Sample", y = "Coverage (%)") +
    ylim(0,10) +
    geom_label(size = 3, angle = 45, color = "black", fill = colpfa)

  # plot coverage summary 2
  coverage_dist_plot = ggplot(data = coverage_table, aes(x = coverage_table$ID, y = coverage_table$PCT_COVERAGE, group = 1, label = coverage_table$PCT_COVERAGE)) +
    theme(legend.position = "top", axis.text.x = element_blank(), axis.title.x=element_blank(), axis.ticks.x=element_blank(), panel.grid.minor = element_line(color = "black", linetype = "dashed"), panel.grid.major = element_blank(), panel.background = element_blank(), plot.margin = unit(c(2,5,0,1), "lines")) +
    labs(title = "Coverage Distribution", x = "", y = "Coverage (%)") +
    geom_boxplot(fill = colpfa)

  # plot duplication rates
  duplications_dist_plot = ggplot(data = duplications_table, aes(x = duplications_table$ID, y = duplications_table$PERCENT_DUPLICATION, group = 1, label = duplications_table$PERCENT_DUPLICATION)) +
    theme(legend.position = "top", axis.text.x = element_text(angle = 90, vjust = 0.5), panel.grid.minor = element_line(color = "black", linetype = "solid"), panel.grid.major = element_blank(), panel.background = element_blank(), plot.margin = unit(c(2,5,0,1), "lines")) +
    labs(title = "Duplication Rates", x = "", y = "Duplication Rate (%)") +
    geom_bar(stat = "identity", fill = colpfa, color = "black") + 
    geom_hline(yintercept = mean_duprate, color=coldup, linetype="dashed") +
    geom_text(vjust = 2)

############# create data table for plotting with chart #############
  # create data.frame from summary table
  alignment_summary = data.frame(unclass(summary(filt_alignmet)), check.names = FALSE, stringsAsFactors = FALSE)

  # select columns
  alignment_summary = select(alignment_summary, c(`   PF_READS`, PF_READS_ALIGNED, PERCENT_DUPLICATION, ` PCT_COVERAGE`))

  # add new column
  alignment_summary= cbind(Stat = 0, alignment_summary)

  # rename column
  alignment_summary[1, 1] = alignment_summary[1, 1] <- "Min"
  alignment_summary[2, 1] = alignment_summary[2, 1] <- "1st Qu"
  alignment_summary[3, 1] = alignment_summary[3, 1] <- "Median"
  alignment_summary[4, 1] = alignment_summary[4, 1] <- "Mean"
  alignment_summary[5, 1] = alignment_summary[5, 1] <- "3rd Qu"
  alignment_summary[6, 1] = alignment_summary[6, 1] <- "Max"

  # remove everything before colon charactrer
  alignment_summary$PF_READS_ALIGNED = gsub(".*:","",alignment_summary$PF_READS_ALIGNED)
  alignment_summary$`   PF_READS` = gsub(".*:","",alignment_summary$`   PF_READS`)
  alignment_summary$PERCENT_DUPLICATION = gsub(".*:","",alignment_summary$PERCENT_DUPLICATION)
  alignment_summary$` PCT_COVERAGE` = gsub(".*:","",alignment_summary$` PCT_COVERAGE`)

  # remove last row in data.frame
  alignment_summary = alignment_summary[-c(7), ] 

  #creating theme for table
  tt = ttheme_minimal(base_size = 10, # font size
                    base_colour = "black", # font color
                    base_family = "", #font family
                    parse = FALSE, # logical, default behaviour for parsing text as plotmath
                    padding = unit(c(4, 4), "mm")) # length-2 unit vector specifying the horizontal and vertical padding of text within each cell

  # compile table
  alignment_summary_table <- tableGrob(alignment_summary, rows=NULL, theme=tt)

  # add rectangle to data
  alignment_summary_table = gtable_add_grob(alignment_summary_table,
                                          grobs = segmentsGrob( # line across the bottom
                                          x0 = unit(0,"npc"),
                                          y0 = unit(0,"npc"),
                                          x1 = unit(1,"npc"),
                                          y1 = unit(0,"npc"),
                                          gp = gpar(lwd = 2.0)),
                                          t = 1, b = 1, l = 1, r = ncol(alignment_summary_table))

############# merge all plots/data table and export as .pdf #############
  # create grid.arrange object
  Alignment_QC = grid.arrange(alignment_plot, coverage_plot, coverage_dist_plot, duplications_dist_plot, alignment_summary_table, nrow= 4, ncol = 4, layout_matrix = rbind(c(1,1,2,2), c(1,1,2,2), c(1,1,3,4), c(5,5,3,4)))

  # save as pdf
  pdf("../mattsada/Desktop/Alignment_summary.pdf", width=14, height=8.5)
  grid.table(Alignment_QC)
  dev.off()
