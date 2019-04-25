module load bioinfo-tools blast

blastn -query ~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/lfts.contigs.fasta \
-subject ~/genome_analysis/analyses/06_comparison/01_blastn/ml04.fna \
-out ~/genome_analysis/analyses/06_comparison/01_blastn/lfts_ml04.txt

blastn -query ~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/lfts.contigs.fasta \
-subject ~/genome_analysis/analyses/06_comparison/01_blastn/ysk.fna \
-out ~/genome_analysis/analyses/06_comparison/01_blastn/lfts_ysk.txt