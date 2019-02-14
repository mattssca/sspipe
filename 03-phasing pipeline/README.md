## Script explenation

(10. Bash-script for performing **BAIT** analysis on aligned and sorted reads. Outputs ideograms and .bed files that will be used for further downstream analysis.)

01. R script for locating breakpoints in strand-seq data using **BreakpointR** package. Used to produce .Rdat files that will be used for extracting information in terms of W/C regions in multiple SS libraries. See [BreakpointR](https://github.com/daewoooo/breakpointR) for more information. 

02. Custom R-script that analyses selected strand- seq libraries for W/C regions. Output (.csv) will be used as input for strandPhase.R script.

03. R script that executes **strandPhaseR** algorithm on selected libraries to build whole-genome haplotypes. See [StrandphaseR](https://github.com/daewoooo/StrandPhaseR) for more information. 

04. R script that performs a pairwise comparison of each child's homolog to both the maternal and paternal homologs.

05. R script for visualizing meiotic breakpoints.