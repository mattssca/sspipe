
# install packages.
source("http://bioconductor.org/biocLite.R") 
biocLite("GenomicRanges") 
biocLite("GenomicAlignments") 
biocLite("BSgenome.Hsapiens.UCSC.hg38")

library(devtools)

# currently working 180516
install_git("git://github.com/daewoooo/StrandPhaseR.git", branch = "old")

# load packages
library('StrandPhaseR')

# set the working directory to the folder where the data is stored.
setwd("~/Desktop/GIAB/strand-seq/D")

#Run StrandPhaseR: 
strandPhaseR(inputfolder = "/home/mattsada/Desktop/GIAB/strand-seq/DATA/sorted/se/", 
             outputfolder = "/home/mattsada/Desktop/GIAB/strand-seq/strandphaseR/output/", 
             positions = "strandPhaseR/snp_list_allChrom.txt", 
             WCregions = "strandPhaseR/WCregions.txt",
						 splitPhasedReads  =  TRUE,
						 callBreaks  =  TRUE,
						 exportVCF  =  TRUE, 
						 bsGenome  =  "BSgenome.Hsapiens.UCSC.hg38",
						 chromosomes = c(1:22),
						 pairedEndReads = TRUE)


