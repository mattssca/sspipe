#!/bin/bash

#download Bowtie2 index refseq
wget http://ftp.ncbi.nlm.nih.gov/genomes/archive/old_genbank/Eukaryotes/vertebrates_mammals/Homo_sapiens/GRCh38/seqs_for_alignment_pipelines/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index.tar.gz -P ./refseq 
gunzip ./refseq/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index.tar.gz

#download refseq in FASTA format
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz -P ./refseq 
gunzip ./refseq/hg38.fa.gz