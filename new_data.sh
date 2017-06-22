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

counts = data[[1]]
colabel <- read.csv("/home/sb/h2az_rnaseq/H2AZ_colnames.csv")
samp2 <- colabel[,-1]
rownames(samp2) <- colabel[,1]

colnames(counts) <- rownames(samp2)

library("DESeq2")
dLRT <- DESeqDataSetFromMatrix(countData = counts, colData = samp2, design = ~ batch + condition)
dLRT <- DESeq(dLRT, test="LRT", full = ~ batch + condition, reduced=~batch)
dLRT_res <- results(dLRT)
write.table(dLRT_res, "/home/sb/h2az_rnaseq/dLRT_res_RNASeq.txt")
grep -v "NA" dLRT_res_RNASeq.txt | perl -pe "s/\h/\t/g" - | perl -pe "s/\"//g" | cut -f1,3,6 > 10a_RNASeq_noNA.txt
awk -F"\t" '{if ($2>1) print $0}' RNASeq_noNA.txt | perl -pe "s/\h/\t/g" - > upregulated_lgfc1.bed
awk -F"\t" '{if ($2<-1) print $0}' RNASeq_noNA.txt | perl -pe "s/\h/\t/g" - > downregulated_lgfc1.bed
awk -F"\t" '{if ($3<0.05) print $0}' downregulated_lgfc1.bed | perl -pe "s/\h/\t/g" - > downregulated_lgfc1_p0.05.bed
awk -F"\t" '{if ($3<0.05) print $0}' upregulated_lgfc1.bed | perl -pe "s/\h/\t/g" - > upregulated_lgfc1_p0.05.bed
