## Overview

This repository contains custom pipeline for going from raw reads in .fastq format all the way to aligned reads, locating putative inversions and refinement of the same and phasing of structural variants in Strand Seq genomic data. The pipeline also exports relevant metrics for the alignment and custom R-scripts for visualizing these metrics are also included. 

This pipeline consists of three individual smaller pipelines. 

1. [Alignment and QC](https://github.com/mattsada/sspipe/tree/master/01-alignment%20pipeline) 
2. [Inversion analysis](https://github.com/mattsada/sspipe/tree/master/02-inversion%20analysis%20pipeline)
3. [Phasing](https://github.com/mattsada/sspipe/tree/master/03-phasing%20pipeline)

For instructions on how to execute, see section [How to execute]()
  
## 1. Alignment pipeline
This first pipeline takes raw sequence data (.fastq) and aligns it to a reference genome using Bowtie2. Aligned reads (.sam) are then converted into binary alignment file (.bam) using **samtools**. Reads are then sorted by left most coordinate, also using **samtools**. Duplicate reads are then marked in alignment data (information extracted as `mdup-metrics.txt`), calling `MarkDuplicates` function of **picardtools** (Duplications are defined as originating from a single fragment of DNA). Next, **samtools** is used to index sorted reads. Alignment data, together with its corresponding index information is then piped to be analyzed with **BAIT**. Additional alignment metrics are retrieved using the `flagstat` function of **samtools** and `CollectAlignmentMetrics` function of **picardools**. Alignment metrics are then compiled and standard data manipulation/subsetting is performed using custom **R** script. Lastly, relevant alignment metrics are plotted and visualized in **R**.

![alt text](https://github.com/mattsada/sspipe/blob/master/figs/alignmentpipe_alignqc.png "alignmentpipe")

#### Dependencies
A complete list of depenencies for executing pipeline. 

| Package       | Version        |
| ------------- |---------------:|
| samtools      | 0.1.19-44428cd |
| bowtie2       | 2.2.3          |
| picard        | 2.18.11        |
| BAIT          | 1.0            |
| R             | 3.5.2          |
| dplyr         | 0.7.8          |
| tidyverse     | 1.2.0          |
| ggplot2       | 3.1.0          |

## 2. Inversion analysis pipeline
The pipeline starts with an R-script that takes bed files generated from previous BAIT analysis (on selected libraries) and locates putative inversions using **InvertR** R package. List of regions to be analyzed needs to be included (regions.txt). The second script concatenates chromosome specific ROI files outputted by **InvertR** into a single ROI list, including all chromosomes. Next, custom R-script subsets data in ROI file into two separate files; Always-Watson-Crick (AWC) and Not-Always-Watson-Crick (NAWC) ROI, depending on Watson/Crick ratio. using **dplyr** package in R. The next script uses `intersect` function of **bedtools** package to filter out all variants in NAWC that are overlapping with events in the AWC file. Variants larger than 15MB are filtered out, using the `filter` function from **bedtools* package. Refined events are then sorted on the leftmost coordinate and outputs a final list of refined inversions in .bed format. The very last script cleans the environment and removes unnecessary files.

![alt text](https://github.com/mattsada/sspipe/blob/master/figs/inversionpipeline_invref.png "inversion")

#### Dependencies
A complete list of depenencies for executing pipeline. 

| Package       | Version        |
| ------------- |---------------:|
| invertR       | 0.1            |
| R             | 3.5.2          |
| dplyr         | 0.7.8          |
| bedtools      | 2.17.0         |


## 3. Phasing pipeline
First breakpoints in strand-seq data are located using the **brakpointR**  R-package. .Rdat files outputted by breakpointR are used for determining regions of W/C regions in multiple strand-seq libraries. Next, custom R-script that analyses selected strand-seq libraries for W/C regions are executed outputted (.csv) will be used as input for strandPhase.R script. Next, strandPhaseR algorithm is executed on selected libraries to build whole-genome haplotypes. If parental libraries are available and included, the last two R-scripts will perform a pairwise comparison of each child's homolog to both the maternal and paternal homologs and visualizing meiotic breakpoints.

![alt text](https://github.com/mattsada/sspipe/blob/master/figs/haplotype_meioticbp.png "haplotype")

#### Dependencies
| Package       | Version        |
| ------------- |---------------:|
| strandphaseR  | 0.1            |
| R             | 3.5.2          |
| dplyr         | 0.7.8          |

## How to Execute
Clone repository and put raw reads in .fastq format in subfolder DATA/fastq. Download reference genome (both bowtie2 formatted and in .fa format). For fast access, see links below. User-provided dependencies go into the corresponding subfolder (such as SNV callset data necessary for haplotype pipeline and regions to be analyzed with invertR etc.)

1. [bowtie2 formatted reference genome GRCh38]()
2. [reference genome in .fa format]() 


