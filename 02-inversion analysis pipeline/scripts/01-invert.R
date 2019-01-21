library(devtools)
install_github(force = TRUE, 'drashley/InvertR')

# load InvertR
library(InvertR)

#set the working directory to the folder where the data is stored
setwd("/home/mattsada/Desktop/GIAB/strand-seq/BAIT/BED_files_BAIT/") 

#load dependencies
roiList <-read.table('/home/mattsada/Desktop/GIAB/strand-seq/InvertR/dependencies/regions.txt') 

#run package
runInvertR(roiList, 
           binSize = 50, 
           WCcutoff = 0.75,
           dataDirectory = "/home/mattsada/Desktop/GIAB/strand-seq/InvertR/output/", 
           gapfile = 0, 
           type = "bed",
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
  
  