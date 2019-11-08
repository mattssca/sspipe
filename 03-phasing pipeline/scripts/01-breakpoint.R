library(breakpointR)

#pe strand-seq libraries
breakpointr(inputfolder = "./DATA/trimmed/", 
            outputfolder = "./03-phasing\ pipeline/output/breakpointR/", 
            chromosomes = paste0 ("chr", c(1:22)), 
            pairedEndReads = TRUE, 
            reuse.existing.files = FALSE, 
            windowsize = 1000000, 
            binMethod = 'size', 
            pair2frgm = FALSE, 
            min.mapq = 10, 
            filtAlt = TRUE, 
            callHotSpots=TRUE)
