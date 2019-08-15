# code for making windows with userdefined bin size
bedtools makewindows -g hg38.chrom.sizes -w 1000000 > hg38.1Mb.windows.bed