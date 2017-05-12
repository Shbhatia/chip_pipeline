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

#samtools get bam format
samtools view -Sb mcf7_grace_mem.sam > mcf7_grace_mem.bam
samtools sort mcf7_grace_mem.bam > sorted_mcf7grace_mem.bam
samtools index -b sorted_mcf7grace_mem.bam

#check mapping efficiency (bwa mem vs bwa aln)
/home/sb/programfiles/bamtools/bamtools stats mcf7_grace_mem.bam #mapping efficiency 96.87% (used for rest of analysis)
/home/sb/programfiles/bamtools/bamtools stats mcf7_grace.bam #mapping efficiency 91.31%

#create genome seqeunce dictionary for GATK using picard
java -jar /home/sb/programfiles/picard/build/libs/picard.jar CreateSequenceDictionary R=/home/sb/genome_data/GRCh38/sequence/hg38.fa O=/home/sb/genome_data/GRCh38/sequence/hg38_reference.dict
samtools sort mcf7_grace_mem.bam > sorted_mcf7grace_mem.bam
#add RG to sorted bam file
java -jar /home/sb/programfiles/picard/build/libs/picard.jar AddOrReplaceReadGroups INPUT=sorted_mcf7grace_mem.bam OUTPUT=sortedmcf7_grace_mem_addRG.bam RGID=HNHCCCCXX RGLB= Merged RGPL=illumina RGPU=HNHCCCCXX RGSM=sample1
samtools index -b sortedmcf7_grace_mem_addRG.bam

#re-alignment with GATK - RTC
java -jar /home/sb/programfiles/GenomeAnalysisTK.jar -T RealignerTargetCreator -R /home/sb/genome_data/GRCh38/sequence/hg38.fa -I /home/sb/genome_seq_mcf7/sortedmcf7_grace_mem_addRG.bam --known /home/sb/programfiles/ftp.broadinstitute.org/bundle/hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf.gz -o forIndelRealigner.intervals
#re-alignment with GATK - IndelRealigner
java -jar /home/sb/programfiles/GenomeAnalysisTK.jar -T IndelRealigner -R /home/sb/genome_data/GRCh38/sequence/hg38.fa -I /home/sb/genome_seq_mcf7/sortedmcf7_grace_mem_addRG.bam -known /home/sb/programfiles/ftp.broadinstitute.org/bundle/hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf.gz -targetIntervals forIndelRealigner.intervals -o /home/sb/genome_seq_mcf7/realigned_mcf7.bam

#base recalibration
java -jar /home/sb/programfiles/GenomeAnalysisTK.jar -T BaseRecalibrator -R /home/sb/genome_data/GRCh38/sequence/hg38.fa -I /home/sb/genome_seq_mcf7/realigned_mcf7.bam -knownSites /home/sb/programfiles/ftp.broadinstitute.org/bundle/hg38/dbsnp_146.hg38.vcf.gz -o recal_mcf7.table

#print reads
java -jar /home/sb/programfiles/GenomeAnalysisTK.jar -nct 20 -T PrintReads -R /home/sb/genome_data/GRCh38/sequence/hg38.fa -I /home/sb/genome_seq_mcf7/realigned_mcf7.bam --BQSR recal_mcf7.table -o /home/sb/genome_seq_mcf7/recal_realign_mcf7.bam

#mark duplicates
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates VALIDATION_STRINGENCY=LENIENT I=/home/sb/genome_seq_mcf7/recal_realign_mcf7.bam O=/home/sb/genome_seq_mcf7/recal_realign_nodup_mcf7.bam M=mcf7marked_dup_metrics.txt

#index
samtools index -b /home/sb/genome_seq_mcf7/recal_realign_nodup_mcf7.bam

#mpileup using samtools
samtools mpileup -ugf /home/sb/genome_data/GRCh38/sequence/hg38.fa /home/sb/genome_seq_mcf7/recal_realign_nodup_mcf7.bam > recal_realign_nodup_mcf7.bcf
/home/sb/programfiles/bcftools/bcftools call recal_realign_nodup_mcf7.bcf --threads 35 -vm -O z -o /home/sb/genome_seq_mcf7/var.raw.bcf.gz

# VCF index
/home/sb/programfiles/bcftools/tabix -p vcf /home/sb/genome_seq_mcf7/var.raw.bcf.gz
#select SNPs & INDELS
java -jar /home/sb/programfiles/GenomeAnalysisTK.jar -T SelectVariants -R /home/sb/genome_data/GRCh38/sequence/hg38.fa -V /home/sb/genome_seq_mcf7/var.raw.vcf.gz -selectType SNP -o /home/sb/genome_seq_mcf7/SNP_var.raw.vcf.gz
java -jar /home/sb/programfiles/GenomeAnalysisTK.jar -T SelectVariants -R /home/sb/genome_data/GRCh38/sequence/hg38.fa -V /home/sb/genome_seq_mcf7/var.raw.vcf.gz -selectType INDEL -o /home/sb/genome_seq_mcf7/INDEL_var.raw.vcf.gz
#Filter by quality
java -jar /home/sb/programfiles/GenomeAnalysisTK.jar -T VariantFiltration -R /home/sb/genome_data/GRCh38/sequence/hg38.fa -V /home/sb/genome_seq_mcf7/SNP_var.raw.vcf.gz --filterExpression "MQ < 40.00" --filterName "MQ" --filterExpression "QD < 2.00" --filterName "QD" --filterExpression "FS > 60.000" --filterName "FS" --filterExpression "MQRankSum < -12.500" --filterName "MQRankSum" --filterExpression "ReadPosRankSum < -8.000" --filterName "ReadPosRankSum" -o /home/sb/genome_seq_mcf7/filtered_snps.vcf
java -jar /home/sb/programfiles/GenomeAnalysisTK.jar -T VariantFiltration -R /home/sb/genome_data/GRCh38/sequence/hg38.fa -V /home/sb/genome_seq_mcf7/INDEL_var.raw.vcf.gz --filterExpression "QD < 2.00" --filterName "QD" --filterExpression "FS > 200.000" --filterName "FS" --filterExpression "ReadPosRankSum < -20.000" --filterName "ReadPosRankSum" -o /home/sb/genome_seq_mcf7/filtered_indels.vcf

#awk statements
awk '{if ($7=="FILTER" || $7=="PASS") print $0}' /home/sb/genome_seq_mcf7/filtered_snps.vcf > test1_snps.vcf

#grep
grep "#" /home/sb/genome_seq_mcf7/filtered_snps.vcf > test1_snps.vcf
grep -v '#' | grep 'PASS' /home/sb/genome_seq_mcf7/filtered_snps.vcf > test1_snps.vcf

#Merge
java -jar /home/sb/programfiles/GenomeAnalysisTK.jar -T CombineVariants -R /home/sb/genome_data/GRCh38/sequence/hg38.fa --variant /home/sb/test1_indels.vcf --variant /home/sb/test1_snps.vcf -o /home/sb/genome_seq_mcf7/merged_snpindel.vcf -genotypeMergeOptions UNIQUIFY

#new fasta
java -jar /home/sb/programfiles/GenomeAnalysisTK.jar -T FastaAlternateReferenceMaker -R /home/sb/genome_data/GRCh38/sequence/hg38.fa -o /home/sb/genome_data/MCF7/MCF7_corrected.fa -V /home/sb/genome_seq_mcf7/merged_snpindel.vcf
