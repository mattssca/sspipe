## Overview

This repository contains custom pipeline for going from raw reads in .fastq format all the way to aligned reads, locating putative inversions and refinement of the same and phasing of structrual variants in Strand Seq genomic data. Pipeline also exports relevant metrics for the alignment and custom R-scripts for visualising these metrics are also included. 

This pipeline consists of three individual smaller pipelines. For instructions on how to execute, see section [How to execute]()

1. [Alignment and QC](https://github.com/mattsada/sspipe/tree/master/01-alignment%20pipeline) 
2. [Inversion analysis](https://github.com/mattsada/sspipe/tree/master/02-inversion%20analysis%20pipeline)
3. [Phasing](https://github.com/mattsada/sspipe/tree/master/03-phasing%20pipeline)
  
## 1. Alignment pipeline

This first pipeline takes raw sequence data (.fastq) and aligns it to a reference genome using Bowtie2. Aligned reads (.sam) are then coverted into binary alignment file (.bam) using **samtools**. Reads are then sorted by left most coordinate, also using **samtools**. Duplicate reads are then marked in alignment data (information extracted as `mdup-metrics.txt`), calling `MarkDuplicates` function of **picardtools** (Duplications are defined as originating from a single fragment of DNA). Next, **samtools** is used to index sorted reads. Alignment data, together with its corresponding index information is then piped to to be analysed with **BAIT**. Additional alignment metrics are retreived using the `flagstat` function of **samtools** and `CollectAlignmentMetrics` function of **picardools**. Alignment metrics are then compiled and standard data manipulation/subsetting is performed using custom **R** script. Lastly, relevant alignment metrics are plotted and visualized in **R**.

#### Dependencies
Complete list of depenencies for executing pipeline. 

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

