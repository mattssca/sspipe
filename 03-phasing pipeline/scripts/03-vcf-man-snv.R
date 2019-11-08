#script for manipulating high conf variant calls (vcf) to produce snv list (chromosome and position) for strandphaseR algorithm.

#read in high conf calls
vcf = read.csv(file = "./03-phasing\ pipeline/dependencies/SNV.csv", sep = "\t", header = TRUE)

#subset data to only consists of "CHR " "POS"
filtered_vcf = data.frame(vcf$CHROM, vcf$POS)

#export manipulated vcf as .txt file
write.table(filtered_vcf, file = "./03-phasing\ pipeline/dependencies/SNV-man.bed", sep = "\", quote = FALSE, row.names = FALSE)

#bash code for replacing "chr" with ""
#awk '{gsub(/^chr/,""); print}' up_variants.txt > high_conf_calls.txt
