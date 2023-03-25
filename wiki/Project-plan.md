# Project plan
## Paper
[Multi-omics reveal the lifestyle of the acidophilic, mineral-oxidizing model species Leptospirillum ferriphilum T](https://aem.asm.org/content/84/3/e02091-17)
- A new sequenced genome of L.ferriphilum type strain (species described for the first time) was presented
- RNA sequencing in continuous culture and batch bioleaching culture elucidated adaptations to mineral environment
  - Bioleaching: extraction of metals from ores through organisms, techniques that present sustainable and environmentally friendly alternatives to traditional methods, recovery of copper from CuFeS2
## Plan
### Overview
#### Goals
Reproduce the work of the paper, and answer additional questions
- De novo assembly of long reads obtained by PacBio SMRT long-read sequencing
- Analysis of the functional omics, identification of genes for various capabilities
- Differential expression analyses of cells grown in different cultures
- Comparison with other species
#### Hypothesis
Similar results to the original paper will be obtained
#### Sample
Leptospirillum ferriphilum type strain, an iron oxidizing bacteria
#### Data
- PacBio DNA long-read sequencing data, in fastq format
- Illumina RNA paired end sequencing data, from 5 samples, each with 2 technical replicates, in fastq format
   - 3 samples from continuous cultures using ferrous iron as the substrate
   - 2 samples from batch, mineral, bioleaching cultures containing chalcopyrite (CuFeS2)
### Analyses and softwares
#### Basic
1. Genome assembly of PacBio reads
   - Canu ~ **11.5 hours**
2. Assembly quality assessment
   - Quast
   - MUMmerplot
3. Structural and functional annotation
   - Prokka
   - eggNOGmapper
4. Synteny comparison with a closely related genome
   - blast
   - Artemis
5. RNA-seq reads preprocessing: trimming + quality check (before and after)
   - FastQC
   - Trimmomatic ~ **15min per file**
6. Mapping and counting RNA-seq reads, and analysing differential expression
   - BWA ~ **5 hours**
   - IGV
   - HTSeq ~ **8 hours**
   - DESeq2
7. Biological interpretation of the results
#### Extra
- Analysis of metabolic and other functional capabilities
- Comparative genomics: comparison of genes in common with 1 or more species
- Identification of other sequences within the genome (promoters, repeats, mobile elements, …)
- Deeper analysis of the differential expression results: e.g. thorough evaluation of systems and genes that are differentially expressed, comparison with the results in the published paper
### Time frame
- 4/4 Project planning
- 4/12 Genome assembly and genome annotation
- 4/25 Comparative genomics
- 5/7 RNA mapping
- 5/27 Final deadline
### Data organization
- Seperate data and code
- Big files are compressed, symbolic links are used
- Working directory is as follow
```
genome_analysis/
├── analyses
│   ├── 01_genome_assembly
│   │   └── 01-lfts-pacbio
│   ├── 02_assembly_quality_assessment
│   │   ├── 01-quast
│   │   └── 02-mummer
│   ├── 03_genome_annotation
│   │   ├── 01-prokka
│   │   └── 02-emapper
│   ├── 04_rna_preprocessing
│   │   ├── 01-fastqc
│   │   ├── 02-trimmomatic
│   │   └── 03-fastqc
│   ├── 05_rna_mapping
│   │   ├── 01-bwa
│   │   ├── 02-htseq
│   │   └── 03-deseq2
│   └── 06_comparison
│       └── 01-blastn
├── code
│   ├── blast.sh
│   ├── bwa.sh
│   ├── canu.sh
│   ├── deseq2.R
│   ├── fastqc1.sh
│   ├── fastqc2.sh
│   ├── htseq.sh
│   ├── mummer.sh
│   ├── parse.py
│   ├── plot.R
│   ├── prokka.sh
│   ├── quast.sh
│   └── trimmometric.sh
├── data
│   ├── DNA_raw_data -> /proj/g2019003/nobackup/private/3_Christel_2017/DNA_raw_data
│   ├── metadata
│   │   └── SraRunTable.txt
│   ├── reference -> /proj/g2019003/nobackup/private/3_Christel_2017/reference
│   ├── RNA_raw_data -> /proj/g2019003/nobackup/private/3_Christel_2017/RNA_raw_data
│   └── RNA_trimmed_reads -> /proj/g2019003/nobackup/private/3_Christel_2017/RNA_trimmed_reads
└── README.md
```
