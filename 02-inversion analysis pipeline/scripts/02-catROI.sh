#!/bin/bash

#cd directory with all ROI files
cd "/home/mattsada/Desktop/invref/ROI/"
sudo cat *txt >> ROI_locations_allChr.txt 

#delete old individual ROI files
rm ROI_locations_Table_b50_chr{1..22}.txt
rm ROI_locations_Table_b50_chrX.txt
