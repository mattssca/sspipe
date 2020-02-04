#!/bin/bash

R CMD BATCH ./testdata/src/inv/01-invert.R
R CMD BATCH ./testdata/src/inv/02-filter.R
sh ./testdata/src/inv/03-sort.sh
sh ./testdata/src/inv/04-merge-count.sh
R CMD BATCH ./testdata/src/inv/05-rm-sing.R
R CMD BATCH ./testdata/src/inv/06-breakpoint.R