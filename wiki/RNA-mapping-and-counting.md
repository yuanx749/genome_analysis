# RNA mapping and counting
## Methods
In order to perform differential analysis on transcriptome sequencing data, preprocessed RNA reads were mapped onto the genome with [**BWA**](http://bio-bwa.sourceforge.net/bwa.shtml). BWA was used since prokaryote does not contain exon-intron structure. The outputs were piped in [**SAMtools**](http://www.htslib.org/doc/samtools.html) to obtain sorted BAM files to avoid generated intermediate files of large size.

Read mapping to CDS was counted with [**HTSeq**](https://htseq.readthedocs.io/en/release_0.9.1/count.html#count). Raw counts for the CDS features of continuous and batch culture samples were subjected to differential analysis in the next stage.

In the original paper, **bowtie2** and **featureCounts** were used instead.
### BWA
Commands:
```bash
bwa index -p lfts ~/genome_analysis/analyses/01_genome_assembly/01-lfts-pacbio/lfts.contigs.fasta
```
First, BWA needs to construct the FM-index for the reference genome.
- -p: prefix of the output database

Then, for each file:
```bash
bwa mem lfts \
-t 2 \
$path${file}_P1.trim.fastq.gz \
$path${file}_P2.trim.fastq.gz |
samtools sort -n -o $file.bam -
```
- -t: number of threads

In the samtools command, -n was chosen to **sort by read names** rather than by chromosomal coordinates, because the default order option in HTSeq is name, in order to save memory. If sorted by position, during the running of HTSeq, read alignments whose mate alignment have not yet been seen are kept in a buffer in memory until the mate is found.
### HTSeq
For each bam file:
```bash
htseq-count -f bam -s reverse -t CDS -i ID \
~/genome_analysis/analyses/05_rna_mapping/01-bwa/${file}.bam \
~/genome_analysis/analyses/05_rna_mapping/02-htseq/lfts.gff \
> ~/genome_analysis/analyses/05_rna_mapping/02-htseq/${file}.txt
```
- -f: format of the input data
- -s: whether the data is from a strand-specific assay.
- -t: feature type (3rd column in GFF file) to be used
- -i: GFF attribute to be used as feature ID

Library preparation was performed with the Illumina TruSeq Stranded total RNA kit. According to this [document](https://support.illumina.com/content/dam/illumina-support/documents/documentation/chemistry_documentation/samplepreps_truseq/truseq-stranded-total-rna-workflow/truseq-stranded-total-rna-workflow-reference-1000000040499-00.pdf), the first read is mapped to the non-coding (antisense) strand, and the second read is mapped to the coding (sense) strand. As a result, **-s reverse** was used in my code. This was also consistent with the setting in the paper. In featureCounts, **-s 2** option was used to mean reversely stranded, counting only the reads mapped to the correct strand.

I discovered that the technical replicates files of RNA reads were actually identical, so I discarded half of the BAM files (around 3GB of one file) to save space.
## Results and discussion
The percentage of reads mapped back to the genome is shown below.

| Sample     | Percentage|
| :--------: |:---------:|
| ERR2036629 | 99.81%    |
| ERR2036630 | 99.84%    |
| ERR2036631 | 69.86%    |
| ERR2036632 | 72.39%    |
| ERR2036633 | 99.87%    |

Percentage difference could be caused by different conditions of experiments. These numbers are not very meaningful since some reads with low alignment score are skipped by HTSeq.
## Q & A
### Mapping
1. What percentage of your reads map back to your contigs? Why do you think that is?
- Samples from the same culture have similar mapping percentage while samples from different culture have different percentage. The max score option in BWA-MEM affects the percentage. Even though nearly 100% reads are mapped back, many of them have low mapping scores. Lower mapping rate in mineral sample could be caused by contamination.
2. What potential issues can cause mRNA reads not to map properly to gene in the chromosome? Do you expect this to differ between prokaryotic and eukaryotic projects?
- Base/read quality, nucleotide content, PCR artifacts, 3’ and 5’ biases, base distribution, insert size distribution, coverage distribution. Eukaryotic genomes contain introns separating exons, and many repetitive regions.
3. What percentage of reads map to genes?
- From the output for HTSeq, roughly 10% of total reads map to genes.
4. How many reads do not map to genes? What does that mean? How does that relate to the type of sequencing data you are mapping?
- Around 0.8 million reads in continuous samples do not map, but up to 2 million reads in mineral samples do not map. It means they cannot be assigned to CDS. Pair-end sequencing data have better accuracy.
5. What do you interpret from your reads coverage differences across the genome?
- Read coverage differences across the genome result from differential expression of different genes.
6. Do you see big differences between replicates?
- There are small differences between biological replicates. The two technical replicated provided by the paper are actually identical.
### Post-mapping analyses
1. What is the structure of a SAM file, and how does it relate to a BAM file?
- SAM file has a format consisting of a header and an alignment section with 11 mandatory fields. BAM file is its binary compressed version.
2. What is the structure of vcf and bcf files?
- VCF file has a format contains a header and 8 mandatory columns in body. BCF is its binary version.
3. What is the difference between the variant quality, the mapping quality and the fastq quality?
- They are calculated in a similar way but based on different error probabilities.
### Read counting
1. What is the distribution of the counts per gene? Are most genes expressed? How many counts would indicate that a gene is expressed?
- The distribution per gene across sample differ among different genes. Some genes have large variance. Most genes are expressed, having counts greater than 0. The counts indicating expression depend on the the research objects are rare or common genes.