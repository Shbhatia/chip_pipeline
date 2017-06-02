#STAR mapping
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/raw_data/S10A_siC_1.fq.gz /home/sb/james/raw_data/S10A_siC_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/star/sic
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/raw_data/S10A_siTRIP12_1.fq.gz /home/sb/james/raw_data/S10A_siTRIP12_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/star/sit

#samtools
samtools view -bS Aligned.out.sam > Aligned.out.bam
samtools sort Aligned.out.bam > sorted.bam
samtools index -b sorted.bam

#Rsubread
data<-featureCounts(c("/home/sb/james/star/sic/10a_sic_sorted.bam", "/home/sb/james/star/sit/10a_sit_sorted.bam"),
annot.ext="/home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf",
isGTFAnnotationFile=TRUE,
minMQS=10,
strandSpecific=0,
isPairedEnd=TRUE,
nthreads=20,
GTF.attrType="gene_name"
)

counts = data[[1]]
colabel <- read.csv("/home/sb/james/james_colnames.csv")
samp2 <- colabel[,-1]
rownames(samp2) <- colabel[,1]

colnames(counts) <- rownames(samp2)

library("DESeq2")
dLRT <- DESeqDataSetFromMatrix(countData = counts, colData = samp2, design = ~ condition)
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res <- results(dLRT)
write.table(dLRT_res, "/home/sb/james/dLRT_res_RNASeq.txt")
write.table(assay(dLRT_vsd), "/home/sb/james/dLRT_vsd.txt")
grep -v "NA" dLRT_res_RNASeq.txt | perl -pe "s/\h/\t/g" - | perl -pe "s/\"//g" | cut -f1,3,6 > 10a_RNASeq_noNA.txt
