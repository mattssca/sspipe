BreakpointR outputfolder contains the following folders.
========================================================
- breakpoints: UCSC browser compatible bedgraphs compiling all breakpoints across all single-cell libraries.
               List of all localized breakpoints in all single-cell libraries.
               Locations of breakpoint hotspots if 'callHotSpots=TRUE'.
- browserfiles: UCSC browser formated files with exported reads, deltaWs and breakPoints for every single-cell library.
                UCSC browser formated list of masked genomic regions if set option 'maskRegions'.
- data: RData files storing results of BreakpointR analysis for each single-cell library in an object of class 'BreakPoint'.
- plots: Genome-wide plots for selected chromsosome, genome-wide heatmap of strand states as well as chromosome specific read distribution together with localized breakpoints.
