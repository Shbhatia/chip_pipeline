#repenrich setup
python programfiles/RepEnrich/RepEnrich_setup.py repenrich/hg38_repeatmasker_clean.txt genome_data/GRCh38/sequence/hg38.fa repenrich/setup_folder_hg38
#bowtie
bowtie /home/sb/repenrich/hg38/hg38 -p 20 -t -m 1 -S --chunkmbs 400 --max /home/sb/10A-rnaseq/10asic_multimap.fastq -1 /home/sb/10A-rnaseq/10a_sic/FCC57BPACXX-WHHUMhahEAAARAAPEI-46_1.fq -2 /home/sb/10A-rnaseq/10a_sic/FCC57BPACXX-WHHUMhahEAAARAAPEI-46_2.fq /home/sb/10A-rnaseq/10asic_unique.sam
bowtie /home/sb/repenrich/hg38/hg38 -p 20 -t -m 1 -S --chunkmbs 400 --max /home/sb/10A-rnaseq/10asit_multimap.fastq -1 /home/sb/10A-rnaseq/10a_sit/FCC57BPACXX-WHHUMhahEAABRAAPEI-47_1.fq -2 /home/sb/10A-rnaseq/10a_sit/FCC57BPACXX-WHHUMhahEAABRAAPEI-47_2.fq /home/sb/10A-rnaseq/10asit_unique.sam

#Mapping stats:

#sb@sjlab2:~$ bowtie /home/sb/repenrich/hg38/hg38 -p 20 -t -m 1 -S --chunkmbs 400 --max /home/sb/10A-rnaseq/10asic_multimap.fastq -1 /home/sb/10A-rnaseq/10a_sic/FCC57BPACXX-WHHUMhahEAAARAAPEI-46_1.fq -2 /home/sb/10A-rnaseq/10a_sic/FCC57BPACXX-WHHUMhahEAAARAAPEI-46_2.fq /home/sb/10A-rnaseq/10asic_unique.sam
#Time loading reference: 00:00:04
#Time loading forward index: 00:00:07
#Time loading mirror index: 00:00:07
#Seeded quality full-index search: 01:28:03
# reads processed: 24136074
# reads with at least one reported alignment: 10175194 (42.16%)
# reads that failed to align: 12355076 (51.19%)
# reads with alignments suppressed due to -m: 1605804 (6.65%)
#Reported 10175194 paired-end alignments to 1 output stream(s)
#Time searching: 01:28:21
#Overall time: 01:28:21
# #of reads processed - #of reads that failed to align = 11780998

#Mapping stats:
#sb@sjlab2:~$ bowtie /home/sb/repenrich/hg38/hg38 -p 20 -t -m 1 -S --chunkmbs 400 --max /home/sb/10A-rnaseq/10asit_multimap.fastq -1 /home/sb/10A-rnaseq/10a_sit/FCC57BPACXX-WHHUMhahEAABRAAPEI-47_1.fq -2 /home/sb/10A-rnaseq/10a_sit/FCC57BPACXX-WHHUMhahEAABRAAPEI-47_2.fq /home/sb/10A-rnaseq/10asit_unique.sam
#Time loading reference: 00:00:04
#Time loading forward index: 00:00:08
#Time loading mirror index: 00:00:08
#Seeded quality full-index search: 01:31:24
# reads processed: 24140023
# reads with at least one reported alignment: 11042118 (45.74%)
# reads that failed to align: 11213437 (46.45%)
# reads with alignments suppressed due to -m: 1884468 (7.81%)
#Reported 11042118 paired-end alignments to 1 output stream(s)
#Time searching: 01:31:45
#Overall time: 01:31:45
# #of reads processed - #of reads that failed to align = 12926586

bowtie /home/sb/repenrich/hg38/hg38 -p 20 -t -m 1 -S --chunkmbs 400 --max /home/sb/10A-rnaseq/mscv_sic_multimap.fastq -1 /home/sb/10A-rnaseq/mscv_sic/MC_1.fastq -2 /home/sb/10A-rnaseq/mscv_sic/MC_2.fastq /home/sb/10A-rnaseq/mscv_sic_unique.sam
bowtie /home/sb/repenrich/hg38/hg38 -p 20 -t -m 1 -S --chunkmbs 400 --max /home/sb/10A-rnaseq/mscv_sit_multimap.fastq -1 /home/sb/10A-rnaseq/mscv_sit/MT_1.fastq -2 /home/sb/10A-rnaseq/mscv_sit/MT_2.fastq /home/sb/10A-rnaseq/mscv_sit_unique.sam

#sb@sjlab2:~/10A-rnaseq/mscv_sic$ bowtie /home/sb/repenrich/hg38/hg38 -p 20 -t -m 1 -S --chunkmbs 400 --max /home/sb/10A-rnaseq/mscv_sic_multimap.fastq -1 /home/sb/10A-rnaseq/mscv_sic/MC_1.fastq -2 /home/sb/10A-rnaseq/mscv_sic/MC_2.fastq /home/sb/10A-rnaseq/mscv_sic_unique.sam
#Time loading reference: 00:00:06
#Time loading forward index: 00:00:12
#Time loading mirror index: 00:00:11
#Seeded quality full-index search: 00:39:41
# reads processed: 31103376
# reads with at least one reported alignment: 11211387 (36.05%)
# reads that failed to align: 17546272 (56.41%)
# reads with alignments suppressed due to -m: 2345717 (7.54%)
#Reported 11211387 paired-end alignments to 1 output stream(s)
#Time searching: 00:40:11
#Overall time: 00:40:11

# #of reads processed - #of reads that failed to align = 13557104

#sb@sjlab2:~$ bowtie /home/sb/repenrich/hg38/hg38 -p 20 -t -m 1 -S --chunkmbs 400 --max /home/sb/10A-rnaseq/mscv_sit_multimap.fastq -1 /home/sb/10A-rnaseq/mscv_sit/MT_1.fastq -2 /home/sb/10A-rnaseq/mscv_sit/MT_2.fastq /home/sb/10A-rnaseq/mscv_sit_unique.sam
#Time loading reference: 00:00:07
#Time loading forward index: 00:00:14
#Time loading mirror index: 00:00:15
#Seeded quality full-index search: 00:50:02
# reads processed: 29550414
# reads with at least one reported alignment: 10847443 (36.71%)
# reads that failed to align: 16009613 (54.18%)
# reads with alignments suppressed due to -m: 2693358 (9.11%)
#Reported 10847443 paired-end alignments to 1 output stream(s)
#Time searching: 00:50:38
#Overall time: 00:50:38

# #of reads processed - #of reads that failed to align = 13540801

#repenrich
python /home/sb/programfiles/RepEnrich/RepEnrich.py /home/sb/repenrich/hg38_repeatmasker_clean.txt /home/sb/repenrich/10a_sic_repenrich 10a_sic /home/sb/repenrich/RepEnrich_setup_hg38 /home/sb/10A-rnaseq/10asic_multimap_1.fastq --fastqfile2 /home/sb/10A-rnaseq/10asic_multimap_1.fastq /home/sb/10A-rnaseq/10asic_unique.bam --cpus 25 --pairedend TRUE
python /home/sb/programfiles/RepEnrich/RepEnrich.py /home/sb/repenrich/hg38_repeatmasker_clean.txt /home/sb/repenrich/10a_sit_repenrich 10a_sit /home/sb/repenrich/RepEnrich_setup_hg38 /home/sb/10A-rnaseq/10asit_multimap_1.fastq --fastqfile2 /home/sb/10A-rnaseq/10asit_multimap_1.fastq /home/sb/10A-rnaseq/10asit_unique.bam --cpus 10 --pairedend TRUE

python /home/sb/programfiles/RepEnrich/RepEnrich.py /home/sb/repenrich/hg38_repeatmasker_clean.txt /home/sb/repenrich/mscv_sic_repenrich mscv_sic /home/sb/repenrich/RepEnrich_setup_hg38 /home/sb/10A-rnaseq/mscv_sic_multimap_1.fastq --fastqfile2 /home/sb/10A-rnaseq/mscv_sic_multimap_2.fastq /home/sb/10A-rnaseq/mscv_sic_unique.bam --cpus 10 --pairedend TRUE
python /home/sb/programfiles/RepEnrich/RepEnrich.py /home/sb/repenrich/hg38_repeatmasker_clean.txt /home/sb/repenrich/mscv_sit_repenrich mscv_sit /home/sb/repenrich/RepEnrich_setup_hg38 /home/sb/10A-rnaseq/mscv_sit_multimap_1.fastq --fastqfile2 /home/sb/10A-rnaseq/mscv_sit_multimap_2.fastq /home/sb/10A-rnaseq/mscv_sit_unique.bam --cpus 10 --pairedend TRUE


#edgeR
# EdgeR example

# Setup - Install and load edgeR
source("http://bioconductor.org/biocLite.R")
biocLite("edgeR")

library('edgeR')

# In the case of a pre-assembled file of the fraction count output do the following:
# counts <- read.csv(file = "counts.csv")

# In the case of seperate outputs, load the RepEnrich results - fraction counts
sicr1 <- read.delim('10a_sic_fraction_counts.txt', header=FALSE)
sitr1 <- read.delim('10a_sit_fraction_counts.txt', header=FALSE)
sicr2 <- read.delim('mscv_sic_fraction_counts.txt', header=FALSE)
sitr2 <- read.delim('mscv_sit_fraction_counts.txt', header=FALSE)

#' Build a counts table
counts <- data.frame(
  row.names = sicr1[,1],
  sicr1 = sicr1[,4], sicr2 = sicr2[,4],
  sitr1 = sitr1[,4], sitr2 = sitr2[,4])

# Build a meta data object. I am comparing young, old, and veryold mice.
# I manually input the total mapping reads for each sample.
# The total mapping reads are calculated using the bowtie logs:
# # of reads processed - # reads that failed to align
meta <- data.frame(
	row.names=colnames(counts),
	condition=c("sic","sic","sit","sit"),
	libsize=c(11780998,13557104,12926586,13540801)
)

# Define the library size and conditions for the GLM
libsize <- meta$libsize
condition <- factor(meta$condition)
design <- model.matrix(~0+condition)
colnames(design) <- levels(meta$condition)

# Build a DGE object for the GLM
y <- DGEList(counts=counts, lib.size=libsize)

# Normalize the data
y <- calcNormFactors(y)
y$samples
plotMDS(y)

# Estimate the variance
y <- estimateGLMCommonDisp(y, design)
y <- estimateGLMTrendedDisp(y, design)
y <- estimateGLMTagwiseDisp(y, design)
plotBCV(y)

# Build an object to contain the normalized read abundance
logcpm <- cpm(y, log=TRUE, lib.size=libsize)
logcpm <- as.data.frame(logcpm)
colnames(logcpm) <- factor(meta$condition)

# Conduct fitting of the GLM
yfit <- glmFit(y, design)

# Initialize result matrices to contain the results of the GLM
results <- matrix(nrow=dim(counts)[1],ncol=0)
logfc <- matrix(nrow=dim(counts)[1],ncol=0)

# Make the comparisons for the GLM
my.contrasts <- makeContrasts(sit_sic = sit – sic, levels = design)

# Define the contrasts used in the comparisons
allcontrasts = c("sit_sic")

# Conduct a for loop that will do the fitting of the GLM for each comparison
# Put the results into the results objects
for(current_contrast in allcontrasts) {
	lrt <- glmLRT(yfit, contrast=my.contrasts[,current_contrast])
	plotSmear(lrt, de.tags=rownames(y))
	title(current_contrast)
	res <- topTags(lrt,n=dim(c)[1],sort.by="none")$table
	colnames(res) <- paste(colnames(res),current_contrast,sep=".")
	results <- cbind(results,res[,c(1,5)])
	logfc <- cbind(logfc,res[c(1)])
}

# Add the repeat types back into the results.
# We should still have the same order as the input data
results$class <- sicr1[,2]
results$type <- sicr1[,3]

# Sort the results table by the logFC
results <- results[with(results, order(-abs(logFC.sit_sic))), ]

# Save the results
write.table(results, 'results.txt', quote=FALSE, sep="\t")

# Plot Fold Changes for repeat classes and types
for(current_contrast in allcontrasts) {
  logFC <- results[, paste0("logFC.", current_contrast)]
  # Plot the repeat classes
  classes <- with(results, reorder(class, -logFC, median))
  par(mar=c(6,10,4,1))
  boxplot(logFC ~ classes, data=results, outline=FALSE, horizontal=TRUE,
          las=2, xlab="log(Fold Change)", main=current_contrast)
  abline(v=0)
  # Plot the repeat types
  types <- with(results, reorder(type, -logFC, median))
  boxplot(logFC ~ types, data=results, outline=FALSE, horizontal=TRUE,
          las=2, xlab="log(Fold Change)", main=current_contrast, cex.axis=0.3)
  abline(v=0)
}

