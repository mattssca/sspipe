#using bedtools to calculate normalized coverage and GC content in user defined bins
for sample in `ls ./DATA/trimmed/*.bam`
do
dir="./DATA/trimmed/"
base=$(basename $sample ".bam")
out="./metrics/gc-cov/out/"
bed="./metrics/gc-cov/bed/"
bedtools intersect -a ./01-alignment\ pipeline/dependencies/hg38.1Mb.windows.bed -b ${dir}/${base}.bam -c -sorted > ${bed}/${base}.counts.bed
bedtools nuc -fi ./refseq/GRCh38.fa -bed ${bed}/${base}.counts.bed | cut -f 1-4,6 > ${out}/${base}.counts.bedhg38.1Mb.windows.counts.gc.bed
done