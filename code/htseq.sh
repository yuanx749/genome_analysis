#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 11:00:00
#SBATCH -J htseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user Xiao.Yuan.0787@student.uu.se

module load bioinfo-tools htseq

for file in ERR2036629 ERR2036630 ERR2036631 ERR2036632 ERR2036633 \
ERR2117288 ERR2117289 ERR2117290 ERR2117291 ERR2117292
do
htseq-count -f bam -t CDS -i ID \
~/genome_analysis/analyses/05_rna_mapping/01_bwa/${file}.bam \
~/genome_analysis/analyses/05_rna_mapping/02_htseq/lfts.gff \
> ~/genome_analysis/analyses/05_rna_mapping/02_htseq/${file}.txt
done