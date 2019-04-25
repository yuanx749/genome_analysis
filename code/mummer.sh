module load bioinfo-tools MUMmer

mummer -b \
~/genome_analysis/data/reference/OBMB01.fasta \
~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/lfts.contigs.fasta \
> ~/genome_analysis/analyses/02_assembly_quality_assessment/02-mummer/output.mums

mummerplot -R ~/genome_analysis/data/reference/OBMB01.fasta \
-Q ~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/lfts.contigs.fasta \
~/genome_analysis/analyses/02_assembly_quality_assessment/02-mummer/output.mums

gnuplot
load "~/genome_analysis/analyses/02_assembly_quality_assessment/02-mummer/out.gp"