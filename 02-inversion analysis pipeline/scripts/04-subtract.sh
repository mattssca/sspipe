#!/bin/bash
 bedtools subtract -a '/home/mattsada/Desktop/invref/bed/ROI_NAWC.bed' \
  -b '/home/mattsada/Desktop/invref/bed/ROI_AWC.bed' \
  -A \
  > '/home/mattsada/Desktop/invref/bed/ROI_subtract.bed'