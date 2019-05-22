#!/bin/bash

bedtools merge -i "./02-inversions\ analysis\ pipeline/output/invref/ROI_locations_allChr.filtered.sorted.bed" -c 1 -o count > "./02-inversions\ analysis\ pipeline/output/invref/ROI_locations_allChr.filtered.sorted.merged.count.bed"
rm "./02-inversions\ analysis\ pipeline/output/invref/ROI_locations_allChr.filtered.sorted.bed"