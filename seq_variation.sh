#get genome fasta from ucsc 
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz
gunzip hg38.fa.gz
#install bwa
git clone https://github.com/lh3/bwa.git

#create bwa index
bwa index -a bwtsw /home/sb/genome_data/GRCh38/sequence/hg38.fa

#alignment using bwa
