#using bedtools to calculate normalized coverage and GC content in user defined bins
for sample in `ls ./testdata/out/mdup/*.bam`
do
dir="./testdata/out/mdup/"
base=$(basename $sample ".bam")
out="./testdata/out/metrics/gc-cov/"
bed="./testdata/out/metrics/gc-cov/"
bedtools intersect -a ./testdata/chr16-dep/GRCh38-chr16.1Mb.windows.bed -b ${dir}/${base}.bam -c -sorted > ${bed}/${base}.counts.bed
bedtools nuc -fi ./testdata/chr16-ref/GRCh38-chr16.fasta -bed ${bed}/${base}.counts.bed | cut -f 1-4,6 > ${out}/${base}.counts.bedhg38.1Mb.windows.counts.gc.bed
done