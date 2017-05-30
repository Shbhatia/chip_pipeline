#installing and loading DESeq2 library
source("https://bioconductor.org/biocLite.R")
biocLite("DESeq2")
library(DESeq2)

#mapping with STAR
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/mcf10_rnaseq/ /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/Hep3B_SiC_K_2.fq --outFileNamePrefix /home/sb/shainan/rnaseq/staroutput/hep3b_sic/

/home/sb/programfiles/STAR/source/STAR   --runThreadN 18   --genomeDir /home/sb/genome_data/GRCh38/star_index_100_ucsc   --readFilesIn /home/sb/mcf10a_rnaseq/10a/sic/FCC57BPACXX-WHHUMhahEAAARAAPEI-46_1.fq  /home/sb/mcf10a_rnaseq/10a/sic/FCC57BPACXX-WHHUMhahEAAARAAPEI-46_2.fq    --outFileNamePrefix /home/sb/star_output/10a_sic_star_ucsc/
/home/sb/programfiles/STAR/source/STAR   --runThreadN 18   --genomeDir /home/sb/genome_data/GRCh38/star_index_100_ucsc   --readFilesIn /home/sb/mcf10a_rnaseq/10a/sit/FCC57BPACXX-WHHUMhahEAABRAAPEI-47_1.fq /home/sb/mcf10a_rnaseq/10a/sit/FCC57BPACXX-WHHUMhahEAABRAAPEI-47_2.fq  --outFileNamePrefix /home/sb/star_output/10a_sit_star_ucsc/

#samtools to get sorted bam file
samtools view -bS Aligned.out.sam > Aligned.out.bam
samtools sort Aligned.out.bam > sorted.bam
samtools index -b sorted.bam 

#Rsubread featurecounts
data<-featureCounts(c("/home/sb/star_output/mc_star_ucsc/mc_aligned_sortedbyc.bam", "/home/sb/star_output/mt_star_ucsc/mt_aligned_sortedbyc.bam", "/home/sb/star_output/10a_sic_star_ucsc/sorted.bam", "/home/sb/star_output/10a_sit_star_ucsc/sorted.bam"),
annot.ext="/home/sb/genome_data/GRCh38/annotation/ucsc/ensGene1.gtf",
isGTFAnnotationFile=TRUE,
minMQS=10,
strandSpecific=0,
isPairedEnd=TRUE,
nthreads=20,
GTF.attrType="transcript_id"
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
dLRT <- DESeqDataSetFromMatrix(countData = cts2, colData = samp2, design = ~ condition)
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res <- results(dLRT)
