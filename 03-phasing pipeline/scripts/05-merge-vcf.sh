#!/bin/bash
# merge multiple vcf files in a folder

# list all.vcf files in a folder
./03-phasing\ pipeline/output/strandphaseR/output/VCFfiles *.vcf > ./03-phasing\ pipeline/output/strandphaseR/output/VCFfiles/vcflist.txt

# merge using bcftools
bcftools concat --file-list ./03-phasing\ pipeline/output/strandphaseR/output/VCFfiles/vcflist.txt -o ./03-phasing\ pipeline/output/strandphaseR/analysis/VCF/vcf.merge.vcf

#sort on chr
vcf-sort ./03-phasing\ pipeline/output/strandphaseR/analysis/VCF/vcf.merge.vcf > ./03-phasing\ pipeline/output/strandphaseR/analysis/VCF/vcf.sort.merge.vcf
