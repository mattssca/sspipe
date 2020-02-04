#!/bin/bash

bedtools merge -i "testdata/out/invertR/refinement/testdata-chr16-GRCh38-filt-sort-invCalls.bed" -d 10000 -c 2 -o count_distinct > "testdata/out/invertR/refinement/testdata-chr16-GRCh38-filt-sort-merged-ci10kb-invCalls.bed"