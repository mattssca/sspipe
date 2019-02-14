## Script explenation

01. R-script that takes bed files generated from previous BAIT analysis (on selected libraries) and locates putative inversions using **InvertR** R package. List of regions to be analysed needs to be included (regions.txt).

02.  Bash-script that concatenates chromosome specific ROI files outputted by InvertR into a single ROI list, including all chromosomes.

03.  R-script that subset data in ROI file into two seperate files (AWC and NAWC ROI) depending on Watson/Crick ratio. using **Dplyr** package in R.

04. Bash-script that uses `intersect` function of **Bedtools** package to filter out all variants in NAWC that are overlapping with events in the AWC file.

05. Bash-script that uses the `filter` function in **Bedtools** to filters out variants larger than 15MB. 

06. Bash-script that `sorts` refined events on the leftmost coordinate. Outputs final list of refined inversions in .bed format. **bedtools** package.

07. Bash-script that removes temporary files and files that are no longer necessary. 