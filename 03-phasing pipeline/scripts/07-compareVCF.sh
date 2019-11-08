#!/bin/bash
#compare two VCFs and output overlaps as .txt

bedtools intersect -wa -a './03-phasing\ pipeline/output/strandphaseR/analysis/VCF/vcf.sort.merge.vcf' -b './03-phasing\ pipeline/dependencies/SNV.vcf' > './03-phasing\ pipeline/output/strandphaseR/analysis/VCF/overlaps.txt'
