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

#Get TSS of each gene:
#UCSC table browser options

#clade:  Mammal   genome: Human    assembly: hg38
#group: Genes and Gene Predictions     track: GENCODE v24    
#table:   knownCanonical
#region:  genome 
#output format: selected fields … 
#knowncanonical_hg38.bed

#Fields from hg38.knownCanonical
#Chrom
#chromStart
#chromEnd

#Fields from hg38.kgXref fields
#geneSymbol

#hg38.knownGene fields
#strand + or -

#get 300kb window around TSS of each gene
more knowncanonical_hg38.bed | awk -F"\t" '{if ($5 == "+") {print $1"\t"($2-150000)"\t"($2+150000)"\t"$4} if ($5 == "-") {print $1"\t"($3-150000)"\t"($3+150000)"\t"$4}}' - | awk -F"\t" '{if ($2 > 0) print $0}' - | perl -pe "s/\h/\t/g" - > tss_300kb_window.bed
#intersect regions with increased H3K27ac signal in 24HY with 300kb window
bedtools intersect -a bedintersect_input_up.bed -b tss_300kb_window.bed -wb > intersect_300kb.bed

cut -f1,2,3,7 intersect_300kb.bed > peak2gene_hg38.bed
#exclude Metazoan genes
grep -v "Metazoa" peak2gene_hg38.bed > peak2gene_hg38_new.bed

#intersect with genes that are upregulated in 24HY
more intersect_300kb.bed | grep -w -f up_24h_genenames_lgfc1.bed | cut -f1,2,3,7 - > DGE_300kb_intersect.bed



#MCF10A HYPOXIA RNA-SEQ
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/grace_10A_rnaseq/A10_0_1.fq.gz /home/sb/grace_10A_rnaseq/A10_0_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/grace_10A_rnaseq/10A_0h/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/grace_10A_rnaseq/A10_4_1.fq.gz /home/sb/grace_10A_rnaseq/A10_4_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/grace_10A_rnaseq/10A_4h/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/grace_10A_rnaseq/A10_24_1.fq.gz /home/sb/grace_10A_rnaseq/A10_24_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/grace_10A_rnaseq/10A_24h/

/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/grace_10A_rnaseq/B7_0_1.fq.gz /home/sb/grace_10A_rnaseq/B7_0_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/grace_10A_rnaseq/MCF7_0h_R2/

