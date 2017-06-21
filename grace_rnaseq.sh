/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/grace_rnaseq/raw_data/MCF7_NO_1.fq.gz /home/sb/grace_rnaseq/raw_data/MCF7_NO_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/grace_rnaseq/star_output/MCF7_0H/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/grace_rnaseq/raw_data/MCF7_4HY_1.fq.gz /home/sb/grace_rnaseq/raw_data/MCF7_4HY_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/grace_rnaseq/star_output/MCF7_4H/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/grace_rnaseq/raw_data/MCF7_24HY_1.fq.gz /home/sb/grace_rnaseq/raw_data/MCF7_24HY_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/grace_rnaseq/star_output/MCF7_24H/

#24 vs 0
data<-featureCounts(c("/home/sb/grace_rnaseq/star_output/MCF7_0H/0h_sorted.bam", "/home/sb/grace_rnaseq/star_output/MCF7_24H/24h_sorted.bam"), 
annot.ext="/home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf",
isGTFAnnotationFile=TRUE,
minMQS=10,
strandSpecific=0,
isPairedEnd=TRUE,
nthreads=20,
GTF.attrType="gene_name"
)

counts = data[[1]]
colabel <- read.csv("/home/sb/grace_rnaseq/grace_colnames24h.csv")
samp2 <- colabel[,-1]
rownames(samp2) <- colabel[,1]
colnames(counts) <- rownames(samp2)

library("DESeq2")
dLRT <- DESeqDataSetFromMatrix(countData = counts, colData = samp2, design = ~ condition)
dLRT$condition <- relevel(dLRT$condition, ref="untreated")
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_res <- results(dLRT)
write.table(dLRT_res, "/home/sb/grace_rnaseq/dLRT_res_RNASeq_24h.txt")

#4 vs 0h
data<-featureCounts(c("/home/sb/grace_rnaseq/star_output/MCF7_0H/0h_sorted.bam", "/home/sb/grace_rnaseq/star_output/MCF7_4H/4h_sorted.bam"), 
annot.ext="/home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf",
isGTFAnnotationFile=TRUE,
minMQS=10,
strandSpecific=0,
isPairedEnd=TRUE,
nthreads=20,
GTF.attrType="gene_name"
)

counts = data[[1]]
colabel <- read.csv("/home/sb/grace_rnaseq/grace_colnames4h.csv")
samp2 <- colabel[,-1]
rownames(samp2) <- colabel[,1]
colnames(counts) <- rownames(samp2)

library("DESeq2")
dLRT <- DESeqDataSetFromMatrix(countData = counts, colData = samp2, design = ~ condition)
dLRT$condition <- relevel(dLRT$condition, ref="untreated")
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_res <- results(dLRT)
write.table(dLRT_res, "/home/sb/grace_rnaseq/dLRT_res_RNASeq_4h.txt")
