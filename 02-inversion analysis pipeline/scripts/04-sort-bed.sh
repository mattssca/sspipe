#!/bin/bash

bedtools sort -i "./02-inversions\ analysis\ pipeline/output/invref/ROI_locations_allChr.filtered.bed" > "./02-inversions\ analysis\ pipeline/output/invref/ROI_locations_allChr.filtered.sorted.bed"
rm "./02-inversions\ analysis\ pipeline/output/invref/ROI_locations_allChr.filtered.bed"