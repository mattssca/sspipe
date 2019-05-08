#!/bin/bash

#make scripts executable
find ./01-alignment\ pipeline/scripts/ -type f -iname "*.sh" -exec chmod +x {} \;

#download Bowtie2 index refseq (if not present)
wget -N ./refseq http://ftp.ncbi.nlm.nih.gov/genomes/archive/old_genbank/Eukaryotes/vertebrates_mammals/Homo_sapiens/GRCh38/seqs_for_alignment_pipelines/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index.tar.gz
gunzip ./refseq/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index.tar.gz

#download refseq in FASTA format
wget -N .refseq http://hgdownload.cse.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz
gunzip ./refseq/hg38.fa.gz

killall Terminal