#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:30:00
#SBATCH -J prokka
#SBATCH --mail-type=ALL
#SBATCH --mail-user Xiao.Yuan.0787@student.uu.se

# Load modules
module load bioinfo-tools
module load prokka

# Your commands
prokka \
-outdir ~/genome_analysis/analyses/03_genome_annotation/01-prokka \
-prefix lfts \
~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/lfts.contigs.fasta
