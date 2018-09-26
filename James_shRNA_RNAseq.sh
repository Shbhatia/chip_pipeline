/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/shrna/sht12/shC_1_1.fq.gz /home/sb/james/shrna/sht12/shC_1_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/shrna/sht12/staralign/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/shrna/sht12/shC_2_1.fq.gz /home/sb/james/shrna/sht12/shC_2_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/shrna/sht12/staralign/shC/R2/

/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/shrna/sht12/shT12_1_1_1.fq.gz /home/sb/james/shrna/sht12/shT12_1_1_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/shrna/sht12/staralign/shT12_1/R1/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/shrna/sht12/shT12_1_2_1.fq.gz /home/sb/james/shrna/sht12/shT12_1_2_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/shrna/sht12/staralign/shT12_1/R2/

/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/shrna/sht12/shT12_2_1_1.fq.gz /home/sb/james/shrna/sht12/shT12_2_1_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/shrna/sht12/staralign/shT12_2/R1/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/shrna/sht12/shT12_2_2_1.fq.gz /home/sb/james/shrna/sht12/shT12_2_2_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/shrna/sht12/staralign/shT12_2/R2/

data<-featureCounts(c("/home/sb/james/shrna/sht12/staralign/shC/R1/shc_R1_sorted.bam", "/home/sb/james/shrna/sht12/staralign/shC/R2/shc_R2_sorted.bam", "/home/sb/james/shrna/sht12/staralign/shT12_1/R1/sht12_1_R1_sorted.bam", "/home/sb/james/shrna/sht12/staralign/shT12_1/R2/sht12_1_R2_sorted.bam"),
annot.ext="/home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf",
isGTFAnnotationFile=TRUE,
minMQS=10,
strandSpecific=0,
isPairedEnd=TRUE,
nthreads=20,
GTF.attrType="gene_name"
)

counts = data[[1]]
colabel <- read.csv("/home/sb/james/shrna/t12/staralign/sht12_2_colnames.csv")
samp2 <- colabel[,-1]
rownames(samp2) <- colabel[,1]
colnames(counts) <- rownames(samp2)

#DESeq2 Wald test 
library("DESeq2")
dds <- DESeqDataSetFromMatrix(countData = counts, colData = samp2, design = ~ batch + condition)
dds$condition <- relevel(dds$condition, ref="untreated")
dds <- DESeq(dds)
dds_res <- results(dds)
write.table(dds_res, "/home/sb/h2az_rnaseq/dds_res_RNASeq.txt")





data<-featureCounts(c("/home/sb/james/shrna/sht12/staralign/shC/R1/shc_R1_sorted.bam", "/home/sb/james/shrna/sht12/staralign/shC/R2/shc_R2_sorted.bam", "/home/sb/james/shrna/sht12/staralign/shT12_2/R1/sht12_2_R1_sorted.bam", "/home/sb/james/shrna/sht12/staralign/shT12_2/R2/sht12_2_R2_sorted.bam"),
annot.ext="/home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf",
isGTFAnnotationFile=TRUE,
minMQS=10,
strandSpecific=0,
isPairedEnd=TRUE,
nthreads=20,
GTF.attrType="gene_name"
)

counts = data[[1]]
colabel <- read.csv("/home/sb/james/shrna/sht12/staralign/sht12_2_colnames.csv")
samp2 <- colabel[,-1]
rownames(samp2) <- colabel[,1]
colnames(counts) <- rownames(samp2)

#DESeq2 Wald test 
library("DESeq2")
dds <- DESeqDataSetFromMatrix(countData = counts, colData = samp2, design = ~ batch + condition)
dds$condition <- relevel(dds$condition, ref="untreated")
dds <- DESeq(dds)
dds_res <- results(dds)
write.table(dds_res, "/home/sb/james/shrna/sht12/staralign/shT122vsshc/dds_res_RNASeq.txt")

grep -v -w "NA" dds_res_RNASeq.txt | perl -pe "s/\h/\t/g" - | perl -pe "s/\"//g" | cut -f1,3,6 > RNASeq_noNA.txt
awk -F"\t" '{if ($2>1) print $0}' RNASeq_noNA.txt | perl -pe "s/\h/\t/g" - > upregulated_lgfc1.bed
awk -F"\t" '{if ($2<-1) print $0}' RNASeq_noNA.txt | perl -pe "s/\h/\t/g" - > downregulated_lgfc1.bed
awk -F"\t" '{if ($3<0.05) print $0}' downregulated_lgfc1.bed | perl -pe "s/\h/\t/g" - > downregulated_lgfc1_p0.05.bed
awk -F"\t" '{if ($3<0.05) print $0}' upregulated_lgfc1.bed | perl -pe "s/\h/\t/g" - > upregulated_lgfc1_p0.05.bed

down=read.table("../overlap/down_overlap_genenames.bed")
down=down$V1
down.ix=which(rownames(x) %in% as.character(down))

up=read.table("../overlap/up_overlap_genenames.bed")
up=up$V1
up.ix=which((rownames(x) %in% as.character(up)) & abs(x$log2FoldChange)>1 )

postscript("volcano_shT12_1.ps", width= 50, height= 50)
 smoothScatter(x$log2FoldChange,-log10(x$padj),xlab=expression('Log'[2]*' Fold Change'),ylab=expression('-Log'[10]*' P-values'))
 p.ix= x$log2FoldChange>1 & x$padj<0.05
 points(x$log2FoldChange[p.ix],-log10(x$padj[p.ix]),col="goldenrod4", pch = 16)
 p.ix= x$log2FoldChange<(-1) & x$padj<0.05
 points(x$log2FoldChange[p.ix],-log10(x$padj[p.ix]),col="darkblue", pch = 16)
 abline(v=1, col ='grey',lty = 2);
 abline(v=(-1), col ='grey',lty = 2);
 abline(h=-log10(.05), col ='grey',lty = 2)
 points(x$log2FoldChange[up.ix],-log10(x$padj[up.ix]),pch = 4,col="red")
 points(x$log2FoldChange[down.ix],-log10(x$padj[down.ix]), pch = 4,col="red")


dev.off()

