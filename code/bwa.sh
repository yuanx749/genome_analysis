#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 7:00:00
#SBATCH -J bwa
#SBATCH --mail-type=ALL
#SBATCH --mail-user Xiao.Yuan.0787@student.uu.se

module load bioinfo-tools bwa samtools

path=/home/xiyu0787/genome_analysis/data/RNA_trimmed_reads/
cd $HOME/genome_analysis/analyses/05_rna_mapping/01_bwa/

bwa index -p lfts ~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/lfts.contigs.fasta

for file in ERR2036629 ERR2036630 ERR2036631 ERR2036632 ERR2036633 \
ERR2117288 ERR2117289 ERR2117290 ERR2117291 ERR2117292
do
bwa mem lfts \
-t 2 \
$path${file}_P1.trim.fastq.gz \
$path${file}_P2.trim.fastq.gz |
samtools sort -n -o $file.bam -
done