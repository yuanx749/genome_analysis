module load bioinfo-tools blast

cd ~/genome_analysis/analyses/06_comparison/01-blastn/

makeblastdb -in lfts.fasta -out lfts -dbtype nucl
blastn -query ml04.fna -out lfts_ml04.crunch -db lfts -outfmt 6
blastn -query ysk.fna -out lfts_ysk.crunch -db lfts -outfmt 6

module load artemis
act