#!/bin/bash
#remove indels (keep SNVs) entries from input callset
vcftools --vcf ./03-phasing\ pipeline/dependencies/SNV-man.bed  --remove-indels --recode --recode-INFO-all --out ./03-phasing\ pipeline/dependencies/SNV-noindel.bed 

#removes SNVs (keep indels) entries from input callset
vcftools --vcf ./03-phasing\ pipeline/dependencies/SNV-man.bed --keep-indels --recode --recode-INFO-all --out ./03-phasing\ pipeline/dependencies/SNV-nosnv.bed 
