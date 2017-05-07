#get genome fasta from ucsc 
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz
gunzip hg38.fa.gz
#install bwa
git clone https://github.com/lh3/bwa.git

#create bwa index
bwa index -a bwtsw /home/sb/genome_data/GRCh38/sequence/hg38.fa

#data from GEO
#rep-1
wget ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByExp/sra/SRX/SRX039/SRX039778/SRR096941/SRR096941.sra
#rep-2
wget ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByExp/sra/SRX/SRX039/SRX039779/SRR096942/SRR096942.sra

#exp-2
wget ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByExp/sra/SRX/SRX101/SRX101494/SRR353720/SRR353720.sra

#convert to fastq
fastq-dump --split-files SRR096941.sra
fastq-dump --split-files SRR096942.sra
fastq-dump --split-files SRR353720.sra

#zip fastq files

#combine replicates for each read pair
cat SRR096941_1.fastq.gz SRR096942_1.fastq.gz > mcf7_1.fastq.gz
cat SRR096941_2.fastq.gz SRR096942_2.fastq.gz > mcf7_2.fastq.gz

#bwa aln
./bwa aln -t 20 /home/sb/genome_data/GRCh38/sequence/hg38.fa /home/sb/genome_seq_mcf7/ENCSR000AHE/mcf7_seq.fq.gz > mcf7_bwaout.sai
#bwa samse
/home/sb/programfiles/bwa/bwa samse /home/sb/genome_data/GRCh38/sequence/hg38.fa /home/sb/genome_seq_mcf7/mcf7_bwaout.sai /home/sb/genome_seq_mcf7/ENCSR000AHE/mcf7_seq.fq.gz mcf7_grace.sam

#bwa mem
/home/sb/programfiles/bwa/bwa mem -M -t 35 /home/sb/genome_data/GRCh38/sequence/hg38.fa /home/sb/genome_seq_mcf7/ENCSR000AHE/mcf7_seq.fq.gz > mcf7_grace_mem.sam
# -M ensures compatibility with picard

samtools view -Sb mcf7_grace.sam |samtools sort - mcf7_grace

