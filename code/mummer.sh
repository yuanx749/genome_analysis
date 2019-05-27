module load bioinfo-tools MUMmer

mummer -b \
~/genome_analysis/data/reference/OBMB01.fasta \
~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/lfts.contig1.fasta \
> ~/genome_analysis/analyses/02_assembly_quality_assessment/02-mummer/output.mums

cd ~/genome_analysis/analyses/02_assembly_quality_assessment/02-mummer/

mummerplot \
-Q ~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/lfts.contig1.fasta \
--png \
~/genome_analysis/analyses/02_assembly_quality_assessment/02-mummer/output.mums
