#STAR alignment
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/h2az_rnaseq/raw_data/S10A_NC_1_1.fq.gz /home/sb/h2az_rnaseq/raw_data/S10A_NC_1_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az_rnaseq/star_output/10A_NC_1/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/h2az_rnaseq/raw_data/S10A_NC_2_1.fq.gz /home/sb/h2az_rnaseq/raw_data/S10A_NC_2_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az_rnaseq/star_output/10A_NC_2/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/h2az_rnaseq/raw_data/S10A_siH2AZ_1_1.fq.gz /home/sb/h2az_rnaseq/raw_data/S10A_siH2AZ_1_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az_rnaseq/star_output/10A_siH2AZ_1/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/h2az_rnaseq/raw_data/S10A_siH2AZ_2_1.fq.gz /home/sb/h2az_rnaseq/raw_data/S10A_siH2AZ_2_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az_rnaseq/star_output/10A_siH2AZ_2/

#samtools convert to bam, sort and index
samtools view -bS Aligned.out.sam > Aligned.out.bam
samtools sort Aligned.out.bam > sorted.bam
samtools index -b sorted.bam

#R programs - Rsubread and DESeq2 for Differential gene expression analysis

#get read counts with Rsubread
library(Rsubread)
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

#DESeq2 Linear Regression model
library("DESeq2")
dLRT <- DESeqDataSetFromMatrix(countData = counts, colData = samp2, design = ~ batch + condition)
dLRT$condition <- relevel(dLRT$condition, ref="untreated")
dLRT <- DESeq(dLRT, test="LRT", full = ~ batch + condition, reduced=~batch)
dLRT_res <- results(dLRT)
write.table(dLRT_res, "/home/sb/h2az_rnaseq/dLRT_res_RNASeq.txt")

#get genes above |lgfc1| and below pval0.05
grep -v "NA" dLRT_res_RNASeq.txt | perl -pe "s/\h/\t/g" - | perl -pe "s/\"//g" | cut -f1,3,6 > 10a_RNASeq_noNA.txt
awk -F"\t" '{if ($2>1) print $0}' RNASeq_noNA.txt | perl -pe "s/\h/\t/g" - > upregulated_lgfc1.bed
awk -F"\t" '{if ($2<-1) print $0}' RNASeq_noNA.txt | perl -pe "s/\h/\t/g" - > downregulated_lgfc1.bed
awk -F"\t" '{if ($3<0.05) print $0}' downregulated_lgfc1.bed | perl -pe "s/\h/\t/g" - > downregulated_lgfc1_p0.05.bed
awk -F"\t" '{if ($3<0.05) print $0}' upregulated_lgfc1.bed | perl -pe "s/\h/\t/g" - > upregulated_lgfc1_p0.05.bed

#python script for overlapping genes between siT and siH
infile1 = open("H2AZ_RNASeq/downregulated_lgfc1_p0.05.bed")
infile2 = open("siT_RNASeq/downregulated_lgfc1_siT_p0.05.bed")
outfile= open("down_overlap_siT_siH2AZ.bed", 'w')
lines1 = infile1.readlines()
lines2 = infile2.readlines()

gene1 = []
lgfc1 = []
pval1 = []
for line1 in lines1:
    elements1 = line1.strip().split("\t")
    gene1.append(elements1[0])
    lgfc1.append(elements1[1])
    pval1.append(elements1[2])

gene2 = []
lgfc2 = []
pval2 = []

for line2 in lines2:
    elements2 = line2.strip().split("\t")
    gene2.append(elements2[0])
    lgfc2.append(elements2[1])
    pval2.append(elements2[2])

for i in range(0, len(gene1)):
    for n in range(0, len(gene2)):
        if gene1[i] == gene2[n]:
            outfile.write(gene1[i] + "\t" + lgfc1[i] + "\t" + pval1[i] + "\t" + gene2[n] + "\t" + lgfc2[n] + "\t" + pval2[n] + "\n")

#ChIP-Seq data
#STAR alignment
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_noann --readFilesIn /home/sb/YZ_CHIP/C/FCHHJVCBBXX_L1_wHAPPI051197-53_1.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/YZ_CHIP/star_output/C/ --alignIntronMax 1
#samtools
samtools view -bS Aligned.out.sam > Aligned.out.bam
samtools sort Aligned.out.bam > C_sorted.bam
samtools index -b C_sorted.bam

#remove duplicates
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/YZ_CHIP/star_output/C_dup.txt INPUT=/home/sb/YZ_CHIP/star_output/C/C_sorted.bam OUTPUT=/home/sb/YZ_CHIP/star_output/C/C_sorted_nodup.bam

