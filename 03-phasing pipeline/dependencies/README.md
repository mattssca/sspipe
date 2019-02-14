Subfolder to store dependencies for executing the **Haplotype analysis and mapping meiotic recombination breakpoints** pipeline. List of dependencies:

WCreagions.csv - file containing regions of libraries with consistent W/C regions in `CHR::START:END::LIBRARY` format. 
SNVcallset.txt - call-set containing positions of SNV. **WARNING** format needs to match WC.reagions.csv and defined chromosomes in strandphase.R script. Standard format is `CHR::POSITION`