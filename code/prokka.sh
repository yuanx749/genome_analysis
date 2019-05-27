module load bioinfo-tools prokka

prokka \
--outdir ~/genome_analysis/analyses/03_genome_annotation/01-prokka \
--prefix lfts \
--locustag LFTS \
--species ferriphilum \
--evalue 1e-9 \
--strain DSM14647 \
--gram negative \
--force \
~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/lfts.contigs.fasta
