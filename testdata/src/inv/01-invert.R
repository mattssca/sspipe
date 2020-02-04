#!/usr/bin/env Rscript

library(devtools)

# load InvertR
library(InvertR)

#load dependencies
chrtable <-read.table('./testdata/chr16-dep/regionTable_GRCh38.chr16.txt')

#set the working directory to the folder where the data is stored
setwd("./testdata/out/mdup/") 

#run package
runInvertR(regionTable = chrtable, 
           binSize = 50, 
           WCcutoff = 0.75, 
           dataDirectory = '../invertR/', 
           type = 'bam', 
           dup = TRUE, 
           qual = 10, 
           padding = 0, 
           minDepth = 20, 
           minReads = 20,
           verbose = TRUE, 
           pdf = TRUE, 
           strand = TRUE, 
           ROI = FALSE, 
           genotype = TRUE,
           findROIs = TRUE)

setwd("../../../../sspipe-master/") 