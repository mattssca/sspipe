#!/bin/bash

#cd directory with all ROI files
cd "./02-inversions\ analysis\ pipeline/output/invertR/ROI"
sed -i '1d' *.txt
cat *txt >> ROI_locations_allChr.txt 

#delete old individual ROI files
rm ROI_locations_Table_b50_chr{1..22}.txt
rm ROI_locations_Table_b50_chrX.txt