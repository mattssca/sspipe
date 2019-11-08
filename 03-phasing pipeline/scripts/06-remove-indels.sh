#!/bin/bash
#remove indels (keep SNVs) entries from SV callset
vcftools --vcf ./03-phasing\ pipeline/dependencies/SNV.vcf  --remove-indels --recode --recode-INFO-all --out ./03-phasing\ pipeline/dependencies/SNV-noindel.bed 
