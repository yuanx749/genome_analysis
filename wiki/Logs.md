# Logs
## Dates
### 4/4
- Draft preliminary project plan
- Understand the data
- Create soft links to data in the project folders
- Genome assembly by Canu
  - input: ~/genome_analysis/data/DNA_raw_data/
  - output: ~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/
### 4/5
- Organize working directory
- Assembly quality check by Quast
  - input: ~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/lfts.contigs.fasta
  - reference: ~/genome_analysis/data/reference/OBMB01.fasta
  - output: ~/genome_analysis/analyses/02_assembly_quality_assessment/01-quast/
### 4/11
- Genome annotation by Prokka
   - input: ~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/lfts.contigs.fasta
   - output: ~/genome_analysis/analyses/03_genome_annotation/01-prokka/
- RNA-seq reads quality check before trimming by FastQC
   - input: ~/genome_analysis/data/RNA_raw_data/
   - output: ~/genome_analysis/analyses/04_rna_preprocessing/01-fastqc/
- RNA-seq trimming by Trimmomatic
   - input: ~/genome_analysis/data/RNA_raw_data/
   - output: ~/genome_analysis/analyses/04_rna_preprocessing/02-trimmomatic/
   - the trimlog file and trimming results files are too large, so remove them and use provided data instead
### 4/12
- Assembly quality check by MUMmer
  - input: ~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/lfts.contigs.fasta
  - reference: ~/genome_analysis/data/reference/OBMB01.fasta
  - output: ~/genome_analysis/analyses/02_assembly_quality_assessment/02-mummer/
- RNA-seq reads quality check after trimming by FastQC
   - input: ~/genome_analysis/data/RNA_trimmed_reads/
   - output: ~/genome_analysis/analyses/04_rna_preprocessing/03-fastqc/
### 4/24
- RNA mapping by BWA
   - input: ~/genome_analysis/data/RNA_trimmed_reads/ \
            ~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/lfts.contigs.fasta
   - output: ~/genome_analysis/analyses/05_rna_mapping/01_bwa/
### 4/25
- Functional annotation by eggNOGmapper (online)
   - input: ~/genome_analysis/analyses/03_genome_annotation/01-prokka/lfts.faa
   - output: ~/genome_analysis/analyses/03_genome_annotation/02-emapper/lfts.faa.emapper.annotations \
   http://eggnogdb.embl.de/#/app/emapper?jobname=MM_enfDAg
- Synteny comparison with closely related genome by blast \
   ~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/lfts.contigs.fasta \
   [Leptospirillum ferriphilum ML-04](https://www.ncbi.nlm.nih.gov/genome/11584?genome_assembly_id=173696) \
   [Leptospirillum ferriphilum YSK](https://www.ncbi.nlm.nih.gov/genome/11584?genome_assembly_id=59538)
### 5/2
- Discard half of bam files because of duplicates, around 3GB of one file
- Read counting by HTSeq
   - input: ~/genome_analysis/analyses/05_rna_mapping/01_bwa/ \
   ~/genome_analysis/analyses/05_rna_mapping/02_htseq/lfts.gff
   - output: ~/genome_analysis/analyses/05_rna_mapping/02_htseq/
### 5/7-5/24
- Differential analysis by DESeq2
- Redo some steps with different options to compare results
- Extra analysis, compare with paper