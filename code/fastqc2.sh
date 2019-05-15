#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 03:00:00
#SBATCH -J fastqc-after
#SBATCH --mail-type=ALL
#SBATCH --mail-user Xiao.Yuan.0787@student.uu.se

module load bioinfo-tools FastQC

for file in ~/genome_analysis/data/RNA_trimmed_reads/*
do
fastqc $file -o ~/genome_analysis/analyses/04_rna_preprocessing/03-fastqc
done