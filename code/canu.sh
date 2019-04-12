#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 15:00:00
#SBATCH -J pacbio_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user Xiao.Yuan.0787@student.uu.se

# Load modules
module load bioinfo-tools
module load canu

# Your commands
canu \
-p lfts \
-d ~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio \
genomeSize=2.6m \
stopOnReadQuality=false \
-pacbio-raw ~/genome_analysis/data/DNA_raw_data/*.fastq.gz
