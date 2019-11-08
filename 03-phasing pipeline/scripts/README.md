## Script explenation

01. R script for locating breakpoints in strand-seq data using **BreakpointR** package. Used to produce .Rdat files that will be used for extracting information in terms of W/C regions in multiple SS libraries. See [BreakpointR](https://github.com/daewoooo/breakpointR) for more information. 

02. Custom R-script that analyses selected strand- seq libraries for W/C regions. Output (.txt) will be used as input for strandPhase.R script.

03. **Optional** R-script for manipulating VCF input file. Keeps 1st (chr) and 2nd (pos) column. Outputs manipulated VCF file in bed format.

04. R script that executes **strandPhaseR** algorithm on selected libraries to build whole-genome haplotypes. See [StrandphaseR](https://github.com/daewoooo/StrandPhaseR) for more information. 

05. Custom shell script that takes chromosome specific VCF files and merges them into one single file. Sorts events on the leftmost coordinate.

06. **Optional** Custom shell script that filters input VCF to only keep SNV or indels.

07. Performance control. Compares phased variants if overlapping with 'truth' dataset. Returns variants in phased VCF that are present in becnhmark dataset. 
