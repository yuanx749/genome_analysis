#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:30:00
#SBATCH -J quast
#SBATCH --mail-type=ALL
#SBATCH --mail-user Xiao.Yuan.0787@student.uu.se

# Load modules
module load bioinfo-tools
module load quast

# Your commands
quast.py \
-o ~/genome_analysis/analyses/02_assembly_quality_assessment/01-quast \
-R ~/genome_analysis/data/reference/OBMB01.fasta \
~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/lfts.contigs.fasta
