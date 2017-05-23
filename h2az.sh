#FASTQC
#STAR alignment
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_100 --readFilesIn /home/sb/h2az/rnaseq/MC_1.fastq.gz /home/sb/h2az/rnaseq/MC_2.fastq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az/star_output/MC/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_100 --readFilesIn /home/sb/h2az/rnaseq/MT_1.fastq.gz /home/sb/h2az/rnaseq/MT_2.fastq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az/star_output/MT/

#pool together technical replicates (2 lanes)
cat FCC57BPACXX-WHHUMhahEAAARAAPEI-46_L1_1.fq.gz FCC57BPACXX-WHHUMhahEAAARAAPEI-46_L2_1.fq.gz > FCC57BPACXX-WHHUMhahEAAARAAPEI-46_1.fq.gz
cat FCC57BPACXX-WHHUMhahEAAARAAPEI-46_L1_2.fq.gz FCC57BPACXX-WHHUMhahEAAARAAPEI-46_L2_2.fq.gz > FCC57BPACXX-WHHUMhahEAAARAAPEI-46_2.fq.gz
#generate STAR genome index (read length = 90)
/home/sb/programfiles/STAR/source/STAR --runThreadN 30 --runMode genomeGenerate --genomeDir genome_data/GRCh38/star_index_90 --genomeFastaFiles /home/sb/genome_data/GRCh38/sequence/ensembl/GRCh38_r77.all.fa --sjdbGTFfile /home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf --sjdbOverhang 89

#STAR alignment (rep2)
/home/sb/programfiles/STAR/source/STAR --runThreadN 20 --genomeDir /home/sb/genome_data/GRCh38/star_index_90 --readFilesIn /home/sb/h2az/rnaseq/sic/FCC57BPACXX-WHHUMhahEAAARAAPEI-46_1.fq.gz /home/sb/h2az/rnaseq/sic/FCC57BPACXX-WHHUMhahEAAARAAPEI-46_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az/star_output/rnaseq/sic/
/home/sb/programfiles/STAR/source/STAR --runThreadN 20 --genomeDir /home/sb/genome_data/GRCh38/star_index_90 --readFilesIn /home/sb/h2az/rnaseq/sit/FCC57BPACXX-WHHUMhahEAABRAAPEI-47_1.fq.gz /home/sb/h2az/rnaseq/sit/FCC57BPACXX-WHHUMhahEAABRAAPEI-47_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az/star_output/rnaseq/sit/

#samtools - get sorted, bam files from alignment output
samtools view -bS Aligned.out.sam > Aligned.out.bam
samtools sort Aligned.out.bam > sorted.bam
samtools index -b sorted.bam

#Rsubread
data<-featureCounts(c("/home/sb/h2az/star_output/rnaseq/MC/sic_r2_sorted.bam", "/home/sb/h2az/star_output/rnaseq/MT/sit_r2_sorted.bam", "/home/sb/h2az/star_output/rnaseq/sic/sic_r1_sorted.bam", "/home/sb/h2az/star_output/rnaseq/sit/sit_r1_sorted.bam"),
annot.ext="/home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf",
isGTFAnnotationFile=TRUE,
minMQS=10,
strandSpecific=0,
isPairedEnd=TRUE,
nthreads=20,
GTF.attrType="gene_name"
)
counts = data[[1]]
colabel <- read.csv("/home/sb/h2az/h2az_colnames.csv")
samp2 <- colabel[,-1]
rownames(samp2) <- colabel[,1]

#make data frames for counts table and sample annotation table
sic <- data.frame(counts[,1])
sit <- data.frame(counts[,2])
cts <- merge(sic, sit, by=0, all=TRUE)
cts2 <- cts[,-1]
cts2(samp2) <- cts[,1]
rownames(cts2) <- cts[,1]
colnames(cts2) <- rownames(samp2)

#DESeq2
library("DESeq2")
dds <- DESeqDataSetFromMatrix(countData = cts2,
                              colData = samp2,
                              design = ~ condition)
dds
res <- results(dds)
res

#DESeq2 - LRT test 
dLRT <- DESeqDataSetFromMatrix(countData = cts2, colData = samp2, design = ~ condition + batch)
dLRT <- DESeq(dLRT, test="LRT", reduced=~batch)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res <- results(dLRT)
