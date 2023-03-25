# Genome annotation
## Method
[**Prokka**](https://github.com/tseemann/prokka), a pipeline for annotation of prokaryotic genomes was used to perform both structural and functional annotation. The output predicted protein sequence file was uploaded to [**EggNOGmapper**](http://eggnogdb.embl.de/#/app/emapper), a web server based on fast orthology prediction, for additional functional annotation. I also played around with **Maker2** on eukaryotes data from my classmate. The result was tricky so I decided not to use on my data.
### Prokka
Command:
```bash
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
```
- --prefix: filename output prefix
- --locustag: locus tag prefix, to avoid randomly generated prefix
- --evalue: similarity e-value cut-off
- --gram: my sample is gram-negative bacteria
- --force: force overwriting existing output folder
## Results and discussion
The number of predicted genes and CDS are similar to the numbers from the paper. However, around half of my prediction are hypothetical proteins. The authors also used Prokka for annotation. Their construction of a **custom genus database** of related genomes when using Prokka could be the reason to produce only 521 hypothetical proteins.

|               | Project  | Paper |
| :-----------: |:--------:| :----:|
| no. of genes  | 2628     | 2541  |
| no. of CDS    | 2571     | 2486  |
| no. of rRNA   | 6        | 6     |
| no. of rRNA   | 48       | 48    |
| no. of tmRNA  | 1        | 1     |

EggNOGmapper predicted 1800 functional genes on contig 1. Result can be viewed in this link: http://eggnogdb.embl.de/#/app/emapper?jobname=MM_cr4caK.
### Annotation
1. What types of features are detected by the software? Which ones are more reliable a priori?
- CDS (coding sequence), tRNA, rRNA, signal peptides, etc. If the input genome is eukaryote, exon, UTR could be detected. tRNA and rRNA are more reliable because of their high conservation across species and relative short sequences and simple structures.
2. How many features of each kind are detected in your contigs? Do you detect the same number of features than the authors? How do they differ?
- See results and discussion.
3. Why is more difficult to do the functional annotation in eukaryotic genomes?
- Genes in eukaryotic genomes contain exons and introns, and alternative splicing complicated further the annotation.
4. How many genes are annotated as 'hypothetical protein'? Why is that so? How would you tackle that problem?
- See results and discussion. Hypothetical protein can be further predicted by homology search and homology modeling to annotate the functions.
5. How can you evaluate the quality of the obtained functional annotation?
- We can manually curate the results of annotation, by comparing to a related genome, comparing to other tools and using information from experiments.