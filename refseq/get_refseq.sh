#!/bin/bash

#cd sspipe-master before executing script

#download Bowtie2 index refseq
wget http://ftp.ncbi.nlm.nih.gov/genomes/archive/old_genbank/Eukaryotes/vertebrates_mammals/Homo_sapiens/GRCh38/seqs_for_alignment_pipelines/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index.tar.gz -P ./refseq 
tar -zxvf ./refseq/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index.tar.gz -C ./refseq/
rm ./refseq/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index.tar.gz

#convert bowtie2 formated reference genome back to FASTA for CollectGCBiasMetrics and other qc
bowtie2-inspect './refseq/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index' > ./refseq/GRCh38.fasta
