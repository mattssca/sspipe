library(devtools)
install_github(force = TRUE, 'drashley/InvertR')

# load InvertR
library(InvertR)

#set the working directory to the folder where the data is stored
setwd("./Desktop/DATA/GIAB/NA12878/mdup/BED_files_BAIT/") 

#load dependencies
chrtable <-read.table('../../inversion_anlysis/dependencies/regions.txt') 

#run package
runInvertR(chrtable, 
           binSize = 50, 
           WCcutoff = 0.75, 
           dataDirectory = '../../inversion_anlysis/output/', 
           type = 'bed', 
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
