#installing and loading DESeq2 library
source("https://bioconductor.org/biocLite.R")
biocLite("DESeq2")
library(DESeq2)

#mapping with STAR
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17
010347/Hep3B_SiC_K_1.fq /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/Hep3B_SiC_K_2.fq --outFileNamePrefix /home/sb/shainan/rnaseq/staroutput/hep3b_sic/

#samtools to get sorted bam file
samtools view -bS Aligned.out.sam > Aligned.out.bam
samtools sort Aligned.out.bam > sorted.bam
samtools index -b sorted.bam 

#Rsubread featurecounts
data<-featureCounts(c("/home/sb/shainan/rnaseq/staroutput/hep3b_sic/sorted.bam", "/home/sb/shainan/rnaseq/staroutput/hep3b_sik/sorted.bam"),
annot.ext="/home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf",
isGTFAnnotationFile=TRUE,
minMQS=10,
strandSpecific=0,
isPairedEnd=TRUE,
nthreads=15,
GTF.attrType="gene_name"
)

counts = data[[1]]
colabel <- read.csv("/home/sb/colnames.csv")
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
