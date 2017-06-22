/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/h2az_rnaseq/raw_data/S10A_NC_1_1.fq.gz /home/sb/h2az_rnaseq/raw_data/S10A_NC_1_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az_rnaseq/star_output/10A_NC_1/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/h2az_rnaseq/raw_data/S10A_NC_2_1.fq.gz /home/sb/h2az_rnaseq/raw_data/S10A_NC_2_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az_rnaseq/star_output/10A_NC_2/

/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/h2az_rnaseq/raw_data/S10A_siH2AZ_1_1.fq.gz /home/sb/h2az_rnaseq/raw_data/S10A_siH2AZ_1_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az_rnaseq/star_output/10A_siH2AZ_1/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/h2az_rnaseq/raw_data/S10A_siH2AZ_2_1.fq.gz /home/sb/h2az_rnaseq/raw_data/S10A_siH2AZ_2_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az_rnaseq/star_output/10A_siH2AZ_2/

samtools view -bS Aligned.out.sam > Aligned.out.bam
samtools sort Aligned.out.bam > sorted.bam
samtools index -b sorted.bam

data<-featureCounts(c("/home/sb/h2az_rnaseq/star_output/10A_NC_1/NC_R1.bam", "/home/sb/h2az_rnaseq/star_output/10A_NC_2/NC_R2.bam", "/home/sb/h2az_rnaseq/star_output/10A_siH2AZ_1/siH2AZ_R1.bam", "/home/sb/h2az_rnaseq/star_output/10A_siH2AZ_2/siH2AZ_R2.bam"), 
annot.ext="/home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf",
isGTFAnnotationFile=TRUE,
minMQS=10,
strandSpecific=0,
isPairedEnd=TRUE,
nthreads=20,
GTF.attrType="gene_name"
)
