#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 03:00:00
#SBATCH -J fastqc-before
#SBATCH --mail-type=ALL
#SBATCH --mail-user Xiao.Yuan.0787@student.uu.se

module load bioinfo-tools FastQC

for file in ~/genome_analysis/data/RNA_raw_data/*
do
fastqc $file -o ~/genome_analysis/analyses/04_rna_preprocessing/01-fastqc
done