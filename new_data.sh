/home/sb/programfiles/STAR/source/STAR --runThreadN 20 --runMode genomeGenerate --genomeDir genome_data/GRCh37/star_index_150 --genomeFastaFiles /home/sb/genome_data/GRCh37/sequence/GRCh37_r75.all.fa --sjdbGTFfile /home/sb/genome_data/GRCh37/annotation/Homo_sapiens.GRCh37.75.gtf --sjdbOverhang 149
#STAR alignment
/home/sb/programfiles/STAR/source/STAR --runThreadN 15 --genomeDir /home/sb/genome_data/GRCh37/star_index_150 --readFilesIn /home/sb/h2az_rnaseq/raw_data/S10A_NC_1_1.fq.gz /home/sb/h2az_rnaseq/raw_data/S10A_NC_1_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az_rnaseq/star_output/10A_NC_1/ --genomeLoad LoadAndKeep
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh37/star_index_150 --readFilesIn /home/sb/h2az_rnaseq/raw_data/S10A_NC_2_1.fq.gz /home/sb/h2az_rnaseq/raw_data/S10A_NC_2_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az_rnaseq/star_output/10A_NC_2/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh37/star_index_150 --readFilesIn /home/sb/h2az_rnaseq/raw_data/S10A_siH2AZ_1_1.fq.gz /home/sb/h2az_rnaseq/raw_data/S10A_siH2AZ_1_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az_rnaseq/star_output/10A_siH2AZ_1/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh37/star_index_150 --readFilesIn /home/sb/h2az_rnaseq/raw_data/S10A_siH2AZ_2_1.fq.gz /home/sb/h2az_rnaseq/raw_data/S10A_siH2AZ_2_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az_rnaseq/star_output/10A_siH2AZ_2/

#samtools convert to bam, sort and index
samtools view -bS Aligned.out.sam > Aligned.out.bam
samtools sort Aligned.out.bam > sorted.bam
samtools index -b sorted.bam

#R programs - Rsubread and DESeq2 for Differential gene expression analysis

#get read counts with Rsubread
library(Rsubread)
data<-featureCounts(c("/home/sb/h2az_rnaseq/star_output/10A_NC_1/NC_R1.bam", "/home/sb/h2az_rnaseq/star_output/10A_NC_2/NC_R2.bam", "/home/sb/h2az_rnaseq/star_output/10A_siH2AZ_1/siH2AZ_R1.bam", "/home/sb/h2az_rnaseq/star_output/10A_siH2AZ_2/siH2AZ_R2.bam"), 
annot.ext="/home/sb/genome_data/GRCh37/annotation/Homo_sapiens.GRCh37.75.gtf",
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

#DESeq2 Wald test 
library("DESeq2")
dds <- DESeqDataSetFromMatrix(countData = counts, colData = samp2, design = ~ batch + condition)
dds$condition <- relevel(dds$condition, ref="untreated")
dds <- DESeq(dds)
dds_res <- results(dds)
write.table(dds_res, "/home/sb/h2az_rnaseq/dds_res_RNASeq.txt")

#get genes above |lgfc1| and below pval0.05
grep -v "NA" dds_res_RNASeq.txt | perl -pe "s/\h/\t/g" - | perl -pe "s/\"//g" | cut -f1,3,6 > RNASeq_noNA.txt
awk -F"\t" '{if ($2>1) print $0}' RNASeq_noNA.txt | perl -pe "s/\h/\t/g" - > upregulated_lgfc1.bed
awk -F"\t" '{if ($2<-1) print $0}' RNASeq_noNA.txt | perl -pe "s/\h/\t/g" - > downregulated_lgfc1.bed
awk -F"\t" '{if ($3<0.05) print $0}' downregulated_lgfc1.bed | perl -pe "s/\h/\t/g" - > downregulated_lgfc1_p0.05.bed
awk -F"\t" '{if ($3<0.05) print $0}' upregulated_lgfc1.bed | perl -pe "s/\h/\t/g" - > upregulated_lgfc1_p0.05.bed

#consensusDB
awk -v col=4 -F '\t' '{$col=gsub(",", "", $col)+1; print $1"\t"$2"\t"$3"\t"$4}' CPDB_pathways_genes.tab > pathway_genenumbers.bed
awk -v col=6 -F '\t' '{$col=gsub(";", "", $col)+1; print $3"\t"$4"\t"$5"\t"$6}' PATH_DOWN.tab > down_genenumbers.bed

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
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh37/star_index_noann --readFilesIn /home/sb/YZ_CHIP/C/FCHHJVCBBXX_L1_wHAPPI051197-53_1.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/YZ_CHIP/star_output/C/ --alignIntronMax 1
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh37/star_index_noannot --readFilesIn /home/sb/YZ_CHIP/C/FCHHJVCBBXX_L1_wHAPPI051197-53_1.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/YZ_CHIP/star_output/C/ --alignIntronMax 1

#samtools
samtools view -bS Aligned.out.sam > Aligned.out.bam
samtools sort Aligned.out.bam > C_sorted.bam
samtools index -b C_sorted.bam

#remove duplicates
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/YZ_CHIP/star_output/C_dup.txt INPUT=/home/sb/YZ_CHIP/star_output/C/C_sorted.bam OUTPUT=/home/sb/YZ_CHIP/star_output/C/C_nodup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/YZ_CHIP/star_output/T_dup.txt INPUT=/home/sb/YZ_CHIP/star_output/T/T_sorted.bam OUTPUT=/home/sb/YZ_CHIP/star_output/T/T_nodup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/YZ_CHIP/star_output/CI_dup.txt INPUT=/home/sb/YZ_CHIP/star_output/CI/CI_sorted.bam OUTPUT=/home/sb/YZ_CHIP/star_output/C/CI_nodup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/YZ_CHIP/star_output/TI_dup.txt INPUT=/home/sb/YZ_CHIP/star_output/TI/TI_sorted.bam OUTPUT=/home/sb/YZ_CHIP/star_output/C/TI_nodup.bam

#samtools sort and index 
samtools sort C_sorted_nodup.bam > C_sort_nodup.bam --threads 10
samtools index -b C_sort_nodup.bam

#MACS2
macs2 predictd -t /home/sb/YZ_CHIP/star_output/C/C_sort_nodup.bam -c /home/sb/YZ_CHIP/star_output/CI/CI_sort_nodup.bam —g 3.08e9 -n h2az_sic --broad --q 0.05 --outdir /home/sb/YZ_CHIP/macs/

#bamCoverage
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/YZ_CHIP/star_output/C/C_nodup_sorted.bam --binSize 1 --normalizeTo1x 2451960000 -e 150 -o /home/sb/YZ_CHIP/star_output/C/C_new.bw
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/YZ_CHIP/star_output/T/T_nodup_sorted.bam --binSize 1 --normalizeTo1x 2451960000 -e 150 -o /home/sb/YZ_CHIP/star_output/T/T_new.bw
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/YZ_CHIP/star_output/CI/CI_sorted.bam --binSize 1 --normalizeTo1x 2451960000 -e 150 -o /home/sb/YZ_CHIP/star_output/CI/CI_new.bw
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/YZ_CHIP/star_output/TI/TI_sorted.bam --binSize 1 --normalizeTo1x 2451960000 -e 150 -o /home/sb/YZ_CHIP/star_output/TI/TI_new.bw

#bamtobed
bedtools bamtobed -i T_nodup_sorted.bam > T.bed
sed 's/^/chr/' T.bed > new_T.bed
grep -v "chrMT" new_T.bed > nomt_T.bed

#diffReps
diffReps.pl --treatment /home/sb/YZ_CHIP/star_output/T/nomt_T.bed --control /home/sb/YZ_CHIP/star_output/C/nomt_C.bed --report /home/sb/YZ_CHIP/TvsC --chrlen /home/sb/genome_data/GRCh37/hg19.chrom.sizes --btr /home/sb/YZ_CHIP/star_output/TI/nomt_TI.bed --bco /home/sb/YZ_CHIP/star_output/CI/nomt_CI.bed --meth gt --nsd broad --noanno --nohs --frag 0 --nproc 17

#computeMatrix
computeMatrix reference-point --referencePoint TSS -b 2000 -a 2000 -R /home/sb/YZ_CHIP/TSS_4kb_nogene.bed -S /home/sb/YZ_CHIP/star_output/C/C.bw -o /home/sb/YZ_CHIP/C_matrix.gz

bam.files <- c("/home/sb/YZ_CHIP/star_output/C/C_nodup_sorted.bam", "/home/sb/YZ_CHIP/star_output/T/T_nodup_sorted.bam", "/home/sb/YZ_CHIP/star_output/CI/CI_nodup_sorted.bam", "/home/sb/YZ_CHIP/star_output/TI/TI_nodup_sorted.bam")
binned <- windowCounts(bam.files, bin=TRUE, width=10000, param=param)

normfacs <- normOffsets(binned)


barplot(x[order(x[2])2],col="salmon",horiz=T,las=2,names.arg=rnames[order(x[2])],main=“KEGG Pathway enrichment for overlapping downreg. genes", border=NA,xlab="Percentage Coverage of Total Genes in Pathway (%)",cex.names=0.5)






boxplot((x[,3]/x[,1]),(x[,4]/x[,1]),outline=0,border=c("blue","goldenrod4"),width=c(4,4),names=c("siControl","siH2AZ"),ylab="Read counts (VST)")
