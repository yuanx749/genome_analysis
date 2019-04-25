#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 3:00:00
#SBATCH -J emapper
#SBATCH --mail-type=ALL
#SBATCH --mail-user Xiao.Yuan.0787@student.uu.se

module load ioinfo-tools, eggNOG-mapper

emapper.py -i ~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/lfts.contigs.fasta \
--output_dir ~/genome_analysis/analyses/03_genome_annotation/02-emapper \
-d bact
