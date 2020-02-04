#!/usr/bin/env Rscript

library(breakpointR)

#pe strand-seq libraries
breakpointr(inputfolder = "./testdata/out/mdup/", 
            outputfolder = "./testdata/out/breakpointR/", 
            chromosomes = paste0 ("chr", c(16)), 
            pairedEndReads = TRUE, 
            reuse.existing.files = FALSE, 
            windowsize = 1000000, 
            binMethod = 'size', 
            pair2frgm = FALSE, 
            min.mapq = 10, 
            filtAlt = TRUE, 
            callHotSpots=TRUE)
