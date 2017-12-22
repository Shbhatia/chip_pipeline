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
dLRT$condition <- relevel(dLRT$condition, ref="untreated")
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_res <- results(dLRT)
write.table(dLRT_res, "/home/sb/james/dLRT_res_RNASeq_relevel.txt")
grep -v "NA" dLRT_res_RNASeq_relevel.txt | perl -pe "s/\h/\t/g" - | perl -pe "s/\"//g" | cut -f1,3,6 > 10a_RNASeq_noNA_relevel.txt

#replicate 2 and HCT116 RNA-Seq
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/rep2/siC1_1_1.fq.gz /home/sb/james/rep2/siC1_1_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/rep2/HCTSICR2/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/rep2/siT12_1_1_1.fq.gz /home/sb/james/rep2/siT12_1_1_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/rep2/HCTSIT12R2/

/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/rep2/siC_116_1.fq.gz /home/sb/james/rep2/siC_116_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/rep2/HCTSICR1/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/rep2/siT12_116_1.fq.gz /home/sb/james/rep2/siT12_116_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/rep2/HCTSIT12R1/

/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/rep2/siCEMT_10A_1.fq.gz /home/sb/james/rep2/siCEMT_10A_1.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/rep2/10ASICR2/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/rep2/siTRIP12EMT_10A_1.fq.gz /home/sb/james/rep2/siTRIP12EMT_10A_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/rep2/10ASIT12R2/

data<-featureCounts(c("/home/sb/james/rep2/HCTSICR1/HCTSICR1_sorted.bam", "/home/sb/james/rep2/HCTSICR2/HCTSIC_sortedR2.bam", "/home/sb/james/rep2/HCTSIT12R1/HCTSIT12_sortedR1.bam", "/home/sb/james/rep2/HCTSIT12R2/HCTSIT12_sortedR2.bam"), 
annot.ext="/home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf",
isGTFAnnotationFile=TRUE,
minMQS=10,
strandSpecific=0,
isPairedEnd=TRUE,
nthreads=20,
GTF.attrType="gene_name"
)
counts = data[[1]]
colabel <- read.csv("/home/sb/james/rep2/HCTSIT12colnames_replicates.csv")
samp2 <- colabel[,-1]
rownames(samp2) <- colabel[,1]
colnames(counts) <- rownames(samp2)

library("DESeq2")
dLRT <- DESeqDataSetFromMatrix(countData = counts, colData = samp2, design = ~ batch + condition)
dLRT$condition <- relevel(dLRT$condition, ref="untreated")
dLRT <- DESeq(dLRT, test="LRT", full=~batch + condition, reduced=~batch)
dLRT_res <- results(dLRT)
write.table(dLRT_res, "/home/sb/shainan/rnaseq/HEP3B_SIK_results_replicates.txt")

data<-featureCounts(c("/home/sb/james/star/sic/10a_sic_sortedR1.bam", "/home/sb/james/rep2/10ASICR2/10ASICR2_sorted.bam", "/home/sb/james/star/sit/10a_sit_sortedR1.bam", "/home/sb/james/rep2/10ASIT12R2/10ASIT12R2_sorted.bam"), 
annot.ext="/home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf",
isGTFAnnotationFile=TRUE,
minMQS=10,
strandSpecific=0,
isPairedEnd=TRUE,
nthreads=20,
GTF.attrType="gene_name"
)
counts = data[[1]]
colabel <- read.csv("/home/sb/10ASIT12colnames_replicates.csv")
samp2 <- colabel[,-1]
rownames(samp2) <- colabel[,1]
colnames(counts) <- rownames(samp2)

library("DESeq2")
dLRT <- DESeqDataSetFromMatrix(countData = counts, colData = samp2, design = ~ batch + condition)
dLRT$condition <- relevel(dLRT$condition, ref="untreated")
dLRT <- DESeq(dLRT, test="LRT", full=~batch + condition, reduced=~batch)
dLRT_res <- results(dLRT)
write.table(dLRT_res, "/home/sb/shainan/rnaseq/HEP3B_SIK_results_replicates.txt")

#DEXSeq - checking for differential splicing - 10A siC vs siT12
samtools sort -n Aligned.out.bam > 10a_sic_sortedR1_n.bam --threads 20

python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_count.py /home/sb/dexseq/Homo_sapiens_DEXSeq.chr.gff /home/sb/james/star/sic/10a_sic_sortedR1_n.bam /home/sb/james/dexseq/10A_untreatedR1.txt -p yes -f bam
python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_count.py /home/sb/dexseq/Homo_sapiens_DEXSeq.chr.gff /home/sb/james/rep2/10ASICR2/10ASICR2_sorted_n.bam /home/sb/james/dexseq/10A_untreatedR2.txt -p yes -f bam
python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_count.py /home/sb/dexseq/Homo_sapiens_DEXSeq.chr.gff /home/sb/james/star/sic/10a_sit_sortedR1_n.bam /home/sb/james/dexseq/10A_treatedR1.txt -p yes -f bam
python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_count.py /home/sb/dexseq/Homo_sapiens_DEXSeq.chr.gff /home/sb/james/rep2/10ASICR2/10ASIT12R2_sorted_n.bam /home/sb/james/dexseq/10A_treatedR2.txt -p yes -f bam

indir = file.path("/home/sb/james/dexseq/")
countFiles = list.files(indir, pattern = "txt$", full.names = "TRUE")
flattenedFile = list.files(indir, pattern="gff$", full.names=TRUE)
sampleTable = read.csv("/home/sb/james/dexseq/10A_dexseq_colnames.csv")
suppressPackageStartupMessages( library( "DEXSeq" ) )
#feed data into R package
dxd = DEXSeqDataSetFromHTSeq(countFiles, sampleData=sampleTable, design= ~ sample + exon + condition:exon, flattenedfile=flattenedFile )
#seq depth normalisation
dxd = estimateSizeFactors( dxd )
#estimating variance of biological replicates
dxd = estimateDispersions( dxd )
#differential exon usage
dxd = testForDEU( dxd )
#calculate log fold changes
dxd = estimateExonFoldChanges( dxd, fitExpToVar="condition")
#store results in a variable dxr1
dxr1 = DEXSeqResults( dxd )
