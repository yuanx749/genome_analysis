#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:00:00
#SBATCH -J trimmomatic
#SBATCH --mail-type=ALL

module load bioinfo-tools trimmomatic

for name in ERR2036629 ERR2036630 ERR2036631 ERR2036632 ERR2036633 \
ERR2117288 ERR2117289 ERR2117290 ERR2117291 ERR2117292
do
java -jar $TRIMMOMATIC_HOME/trimmomatic.jar PE -threads 1 \
# -trimlog ~/genome_analysis/analyses/04_rna_preprocessing/02-trimmomatic/$name.txt \
~/genome_analysis/data/RNA_raw_data/${name}_1.fastq.gz \
~/genome_analysis/data/RNA_raw_data/${name}_2.fastq.gz \
~/genome_analysis/analyses/04_rna_preprocessing/02-trimmomatic/$name.1P.fastq.gz \
~/genome_analysis/analyses/04_rna_preprocessing/02-trimmomatic/$name.1U.fastq.gz \
~/genome_analysis/analyses/04_rna_preprocessing/02-trimmomatic/$name.2P.fastq.gz \
~/genome_analysis/analyses/04_rna_preprocessing/02-trimmomatic/$name.2U.fastq.gz \
ILLUMINACLIP:$TRIMMOMATIC_HOME/adapters/TruSeq3-PE.fa:2:30:10 \
LEADING:20 \
TRAILING:20 \
SLIDINGWINDOW:1:3 \
MINLEN:40 \
MAXINFO:40:0.5
done