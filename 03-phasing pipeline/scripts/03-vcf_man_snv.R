#script for manipulating high conf variant calls (vcf) to produce snv list (chromosome and position) for strandphaseR algorithm.

#read in high conf calls
vcf = read.csv(file = "../mattsada/Desktop/GIAB/highconf/NA12878_HG001/vcfhighconf.csv", sep = "\t", header = TRUE)

#subset data to only consists of "CHR " "POS"
filtered_vcf = data.frame(vcf$CHROM, vcf$POS)

#export manipulated vcf as .txt file
write.table(filtered_vcf, file = "./Desktop/GIAB/highconf/NA12878_HG001/up_variants.txt", sep = "\", quote = FALSE, row.names = FALSE)

#bash code for replacing "chr" with ""
#awk '{gsub(/^chr/,""); print}' up_variants.txt > high_conf_calls.txt
