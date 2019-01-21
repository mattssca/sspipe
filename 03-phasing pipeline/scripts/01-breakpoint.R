#github install
library(devtools)
install_github("daewoooo/breakpointRdata")
install_github("daewoooo/breakpointR")

#biconductor install
install.packages("BiocManager")
BiocManager::install("breakpointR", version = "3.8")

library(breakpointR)

#se libraries
breakpointr(inputfolder = "../mattsada/Desktop/tmp/se/", 
            outputfolder = "../mattsada/Desktop/tmp/output/", 
            chromosomes = paste0 ("chr", c(1:22)), 
            pairedEndReads = FALSE, 
            reuse.existing.files = FALSE, 
            windowsize = 1000000, 
            binMethod = 'size', 
            pair2frgm = FALSE, 
            min.mapq = 10, 
            filtAlt = TRUE, 
            callHotSpots=TRUE)

#pe libraries
breakpointr(inputfolder = "../mattsada/Desktop/tmp/pe/", 
            outputfolder = "../mattsada/Desktop/tmp/pe-output/", 
            chromosomes = paste0 ("chr", c(1:22)), 
            pairedEndReads = TRUE, 
            reuse.existing.files = FALSE, 
            windowsize = 1000000, 
            binMethod = 'size', 
            pair2frgm = FALSE, 
            min.mapq = 10, 
            filtAlt = TRUE, 
            callHotSpots=TRUE)
