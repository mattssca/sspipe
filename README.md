## Overview

This repository contains custom pipeline for going from raw reads in .fastq format all the way to aligned reads, locating putative inversions and refinement of the same and phasing of structrual variants in Strand Seq genomic data. Pipeline also exports relevant metrics for the alignment and custom R-scripts for visualising these metrics are also included. 

This pipeline consists of three individual smaller pipelines. For instructions on how to execute pipeline, see section [How to execute]()

1. [Alignment and QC](https://github.com/mattsada/sspipe/tree/master/01-alignment%20pipeline) 
2. [Inversion analysis](https://github.com/mattsada/sspipe/tree/master/02-inversion%20analysis%20pipeline)
3. [Phasing](https://github.com/mattsada/sspipe/tree/master/03-phasing%20pipeline)
  
### 1. Alignment pipeline
![alt text](https://github.com/mattsada/sspipe/blob/master/01-alignment%20pipeline/alignmentpipe_alignqc%20.pdf "alignment pipeline")
