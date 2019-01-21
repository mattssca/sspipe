#!/bin/bash
 bedtools intersect -a '/home/mattsada/Desktop/invref/bed/ROI_NAWC.bed' \
  -b '/home/mattsada/Desktop/invref/bed/ROI_AWC.bed' \
  -v \
  > '/home/mattsada/Desktop/invref/bed/ROI_intersect.bed'