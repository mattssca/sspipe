#!/bin/bash

./01-alignment\ pipeline/scripts/01-pe-bowtie2-align.sh
echo "01-pe-bowtie2-align.sh executed succesfully"
./01-alignment\ pipeline/scripts/02-sam2bam.sh
echo "02-sam2bam.sh executed succesfully"
rm -rf ./DATA/sam/*
./01-alignment\ pipeline/scripts/03-bamsort.sh
echo "03-bamsort.sh executed succesfully"
rm -rf ./DATA/bam/*
./01-alignment\ pipeline/scripts/04-mark-dup-picard.sh
echo "04-mark-dup-picard.sh executed succesfully"
rm -rf ./DATA/sorted/*
./01-alignment\ pipeline/scripts/05-index.sh
echo "05-index.sh executed succesfully"
./01-alignment\ pipeline/scripts/06-align-met-picard.sh
echo "06-align-met-picard.sh executed succesfully"
./01-alignment\ pipeline/scripts/07-align-met-flagstat.sh
echo "07-align-met-flagstat.sh executed succesfully"
./01-alignment\ pipeline/scripts/10-BAIT.sh
echo "10-BAIT.sh executed succesfully"
