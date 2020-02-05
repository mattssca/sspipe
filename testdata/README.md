# Test data-set

This repository contains all the necessary files to execute the workflow. Testdata-set samples is drawn from [previously sequenced](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5088598/) Strand-Seq data for NA12878. Test data-set consists of 5 randomly selected Strand-Seq libraries, that all passes the stated quality evaluation criteria.

**note** Due to the sparseness of sequenced Strand-Seq libraries, phasing pipeline will **not** run on selected libraries (currently relying on multiple libraries to succesfully identify WC regions and construct anchor haplotypes). For more info on how multiple single cells and coverage relate to phasing performance, see figure 1.

## How to execute:
1. Make sure all (except for Picard tools, included in `packages` folder) dependencies are correctly installed and added to path.
2. cd main repository (sspipe-master)
3. Execute **test-master.sh**
4. Results/figures/tables are stored in `out` folder within the testdata repo.