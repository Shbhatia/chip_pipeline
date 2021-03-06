#get transcriptome files for cdna and ncRNA
wget ftp://ftp.ensembl.org/pub/current_fasta/homo_sapiens/cdna/Homo_sapiens.GRCh38.cdna.all.fa.gz
wget ftp://ftp.ensembl.org/pub/current_fasta/homo_sapiens/ncrna/Homo_sapiens.GRCh38.ncrna.fa.gz
cat Homo_sapiens.GRCh38.cdna.all.fa.gz Homo_sapiens.GRCh38.ncrna.fa.gz > Homo_sapiens.GRCh38.allrna.fa.gz
#kallisto index build hg38
kallisto index -i /home/sb/shainan/rnaseq/index_hg38.idx /home/sb/genome_data/GRCh38/sequence/Homo_sapiens.GRCh38.allrna.fa.gz
#kallisto quantification (bootstrap 100)
kallisto quant -i /home/sb/shainan/rnaseq/index_hg38.idx -o /home/sb/shainan/rnaseq/hep3b_sic_output -b 100 -t 20 /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/Hep3B_SiC_K_1.fq.gz /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/Hep3B_SiC_K_2.fq.gz
kallisto quant -i /home/sb/shainan/rnaseq/index_hg38.idx -o /home/sb/shainan/rnaseq/hep3b_sik_output -b 100 -t 20 /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/Hep3B_SiK_1.fq.gz /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/Hep3B_SiK_2.fq.gz





#STAR index generation (150 bp; hg38 genome build)
/home/sb/programfiles/STAR/source/STAR --runThreadN 17 --runMode genomeGenerate --genomeDir genome_data/GRCh38/star_index_150 --genomeFastaFiles /home/sb/genome_data/GRCh38/sequence/ensembl/GRCh38_r77.all.fa --sjdbGTFfile /home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf --sjdbOverhang 149
#STAR alignment of RNASeq reads (150bp)
/home/sb/programfiles/STAR/source/STAR   --runThreadN 18   --genomeDir /home/sb/genome_data/GRCh38/star_index_150  --readFilesIn /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/Hep3B_SiC_K_1.fq /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/Hep3B_SiC_K_2.fq --outFileNamePrefix /home/sb/shainan/rnaseq/staroutput/hep3b_sic/
/home/sb/programfiles/STAR/source/STAR   --runThreadN 18   --genomeDir /home/sb/genome_data/GRCh38/star_index_150  --readFilesIn /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/Hep3B_SiK_1.fq /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/Hep3B_SiK_2.fq --outFileNamePrefix /home/sb/shainan/rnaseq/staroutput/hep3b_sik/
/home/sb/programfiles/STAR/source/STAR   --runThreadN 18   --genomeDir /home/sb/genome_data/GRCh38/star_index_150  --readFilesIn /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/LO2_DMSO_1.fq /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/LO2_DMSO_2.fq --outFileNamePrefix /home/sb/shainan/rnaseq/staroutput/lo2_dmso/
/home/sb/programfiles/STAR/source/STAR   --runThreadN 18   --genomeDir /home/sb/genome_data/GRCh38/star_index_150  --readFilesIn /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/LO2_JQ1_1.fq /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/LO2_JQ1_2.fq --outFileNamePrefix /home/sb/shainan/rnaseq/staroutput/lo2_jq1/
/home/sb/programfiles/STAR/source/STAR   --runThreadN 18   --genomeDir /home/sb/genome_data/GRCh38/star_index_150  --readFilesIn /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/LO2_SiC_1.fq /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/LO2_SiC_2.fq --outFileNamePrefix /home/sb/shainan/rnaseq/staroutput/lo2_sic/
/home/sb/programfiles/STAR/source/STAR   --runThreadN 18   --genomeDir /home/sb/genome_data/GRCh38/star_index_150  --readFilesIn /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/LO2_SiK_1.fq /home/sb/shainan/rnaseq/ftpdata.novogene.cn:2300/C101HW17010347/LO2_SiK_2.fq --outFileNamePrefix /home/sb/shainan/rnaseq/staroutput/lo2_sik/

samtools view -bS Aligned.out.sam > Aligned.out.bam
samtools sort Aligned.out.bam > sorted.bam
samtools index -b sorted.bam

#using htseq-count

htseq-count -f bam -r pos --stranded=no /home/sb/shainan/rnaseq/staroutput/hep3b_sik/sorted.bam /home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf
htseq-count -f bam -r pos --stranded=no /home/sb/shainan/rnaseq/staroutput/hep3b_sic/sorted.bam /home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf
htseq-count -f bam -r pos --stranded=no /home/sb/shainan/rnaseq/staroutput/lo2_dmso/sorted.bam /home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf
htseq-count -f bam -r pos --stranded=no /home/sb/shainan/rnaseq/staroutput/lo2_jq1/sorted.bam /home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf
htseq-count -f bam -r pos --stranded=no /home/sb/shainan/rnaseq/staroutput/lo2_sic/sorted.bam /home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf
htseq-count -f bam -r pos --stranded=no /home/sb/shainan/rnaseq/staroutput/lo2_sik/sorted.bam /home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf


#running DESeq with R (hep3b sic vs sik)
datafile = file.path("/home/sb/shainan/rnaseq/staroutput/final_counts_hep3b.tsv")
hep3bcounttable = read.table(datafile, header=TRUE, row.names=1 )
hep3bdesign = data.frame(row.names = colnames( hep3bcounttable ), condition = c( "untreated", "treated"), libType = c("paired-end", "paired-end" ) )
pairedSamples = hep3bdesign$libType == "paired-end"
countTable = hep3bcounttable[ , pairedSamples ]
condition = hep3bdesign$condition[ pairedSamples ]
library( "DESeq" )
cds = newCountDataSet( countTable, condition )
cds = estimateSizeFactors( cds )
sizeFactors( cds )
head( counts( cds, normalized=TRUE ) )
cds = estimateDispersions( cds, method="blind", sharingMode="fit-only" )
res = nbinomTest( cds, "untreated", "treated" )
write.csv( res, file="hep3b_sicvssik.csv")



datafile = file.path("/home/sb/shainan/rnaseq/staroutput/final_counts_lo2sicvssik.txt")
lo2counttable = read.table(datafile, header=TRUE, row.names=1 )
lo2design = data.frame(row.names = colnames( lo2counttable ), condition = c( "untreated", "treated"), libType = c("paired-end", "paired-end" ) )
pairedSamples = lo2design$libType == "paired-end"
countTable = lo2counttable[ , pairedSamples ]
condition = lo2design$condition[ pairedSamples ]
library( "DESeq" )
cds = newCountDataSet( countTable, condition )
cds = estimateSizeFactors( cds )
sizeFactors( cds )
head( counts( cds, normalized=TRUE ) )
cds = estimateDispersions( cds, method="blind", sharingMode="fit-only" )
res = nbinomTest( cds, "untreated", "treated" )
write.csv( res, file="lo2_sicvssik.csv")


#Create boxplot (log2fragment counts)
datafile = file.path("/Users/sbhatia/Documents/sjdata/shainan/shainan_rnaseq_analysis/output_DESeq/counts_matrices/final_counts_hep3b.tsv")
hep3bcounttable = read.table(datafile, header=TRUE, row.names=1)
hep3bdesign = data.frame(hep3bcounttable)




/home/sb/programfiles/STAR/source/STAR   --runThreadN 18   --genomeDir /home/sb/genome_data/GRCh38/star_index_150  --readFilesIn /home/sb/shianan_sep17/DMSO_1.fq.gz /home/sb/shianan_sep17/DMSO_2.fq.gz --outFileNamePrefix /home/sb/shianan_sep17/HEP3B_DMSO/
/home/sb/programfiles/STAR/source/STAR   --runThreadN 18   --genomeDir /home/sb/genome_data/GRCh38/star_index_150  --readFilesIn /home/sb/shianan_sep17/HEP3B_rep1/Hep3BDMSO_HWN2YCCXX_L5_1.fq.gz /home/sb/shianan_sep17/HEP3B_rep1/Hep3BDMSO_HWN2YCCXX_L5_2.fq.gz --outFileNamePrefix /home/sb/shianan_sep17/HEP3B_DMSO_R1/
/home/sb/programfiles/STAR/source/STAR   --runThreadN 18   --genomeDir /home/sb/genome_data/GRCh38/star_index_150  --readFilesIn /home/sb/shianan_sep17/HEP3B_rep1/Hep3BJQ1_HWN2YCCXX_L5_1.fq.gz /home/sb/shianan_sep17/HEP3B_rep1/Hep3BJQ1_HWN2YCCXX_L5_2.fq.gz --outFileNamePrefix /home/sb/shianan_sep17/HEP3B_JQ1_R1/

data<-featureCounts(c("/home/sb/shainan/rnaseq/staroutput/HEP3B_DMSO_R1/DMSOR1_sorted.bam", "/home/sb/shainan/rnaseq/staroutput/HEP3B_DMSO_R2/DMSOR2_sorted.bam", "/home/sb/shainan/rnaseq/staroutput/HEP3B_JQ1_R1/JQ1R1_sorted.bam", "/home/sb/shainan/rnaseq/staroutput/HEP3B_JQ1_R2/JQ1R2_sorted.bam"), 
annot.ext="/home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf",
isGTFAnnotationFile=TRUE,
minMQS=10,
strandSpecific=0,
isPairedEnd=TRUE,
nthreads=20,
GTF.attrType="gene_name"
)
counts = data[[1]]
colabel <- read.csv("/home/sb/shainan/rnaseq/staroutput/JQ1colnames_replicates.csv")
samp2 <- colabel[,-1]
rownames(samp2) <- colabel[,1]
colnames(counts) <- rownames(samp2)

library("DESeq2")
dLRT <- DESeqDataSetFromMatrix(countData = counts, colData = samp2, design = ~ batch + condition)
dLRT$condition <- relevel(dLRT$condition, ref="untreated")
dLRT <- DESeq(dLRT, test="LRT", full=~batch+condition, reduced=~batch)
dLRT_res <- results(dLRT)
write.table(dLRT_res, "/home/sb/shainan/rnaseq/HEP3B_JQ1_results_replicates.txt")

data<-featureCounts(c("/home/sb/shainan/rnaseq/staroutput/hep3b_sic/SICR1_sorted.bam", "/home/sb/shainan/rnaseq/staroutput/HEP3B_sic_R2/SICR2_sorted.bam", "/home/sb/shainan/rnaseq/staroutput/hep3b_sik/SITR1_sorted.bam", "/home/sb/shainan/rnaseq/staroutput/HEP3B_sit_R2/SITR2_sorted.bam"), 
annot.ext="/home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf",
isGTFAnnotationFile=TRUE,
minMQS=10,
strandSpecific=0,
isPairedEnd=TRUE,
nthreads=20,
GTF.attrType="gene_name"
)
counts = data[[1]]
colabel <- read.csv("/home/sb/shainan/rnaseq/staroutput/SIKcolnames_replicates.csv")
samp2 <- colabel[,-1]
rownames(samp2) <- colabel[,1]
colnames(counts) <- rownames(samp2)

library("DESeq2")
dLRT <- DESeqDataSetFromMatrix(countData = counts, colData = samp2, design = ~ batch + condition)
dLRT$condition <- relevel(dLRT$condition, ref="untreated")
dLRT <- DESeq(dLRT, test="LRT", full=~batch + condition, reduced=~batch)
dLRT_res <- results(dLRT)
write.table(dLRT_res, "/home/sb/shainan/rnaseq/HEP3B_SIK_results_replicates.txt")
