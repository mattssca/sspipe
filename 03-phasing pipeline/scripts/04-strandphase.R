#how to aquire StrandPhaseR package
#library(devtools) 
#install_git("git://github.com/daewoooo/StrandPhaseR.git", branch = "devel")
#BiocManager::install("BSgenome.Hsapiens.UCSC.hg38")

# load packages
library(StrandPhaseR)
library(BSgenome.Hsapiens.UCSC.hg38)

#run strandphaseR: 
strandPhaseR(inputfolder = "./DATA/trimmed/", 
             outputfolder = "/03-phasing\ pipeline/output/strandphaseR/", 
             positions = "./03-phasing\ pipeline/dependencies/SNV.bed", 
             WCregions = "./03-phasing\ pipeline/dependencies/wc_regions.txt",
	     exportVCF  =  'spr_output', 
	     bsGenome  =  'BSgenome.Hsapiens.UCSC.hg38',
	     pairedEndReads = TRUE)
