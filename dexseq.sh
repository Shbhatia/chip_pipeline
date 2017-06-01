#use ensembl annotation and ensembl hg38 genome sequence to create STAR genome index
#align fastq to above STAR genome index using STAR
#prepare annotation
python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_prepare_annotation.py /home/sb/genome_data/GRCh38/annotation/

#samtools sort by name
samtools sort -n Aligned.out.bam > sorted_n.bam --threads 20

#created bin intervals
python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_count.py /home/sb/Homo_sapiens_DEXSeq.chr.gff /home/sb/star_output/10a_sic/sorted_n.bam /home/sb/dexseq_untreated1.txt -p yes -f bam
python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_count.py /home/sb/Homo_sapiens_DEXSeq.chr.gff /home/sb/star_output/10a_sit/sorted_n.bam /home/sb/dexseq_treated1.txt -p yes -f bam
python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_count.py /home/sb/Homo_sapiens_DEXSeq.chr.gff /home/sb/star_output/mc_star_output/sorted_n.bam /home/sb/dexseq_untreated2.txt -p yes -f bam
python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_count.py /home/sb/Homo_sapiens_DEXSeq.chr.gff /home/sb/star_output/mt_star_output/sorted_n.bam /home/sb/dexseq_treated2.txt -p yes -f bam

#DEXSeq workflow - R
indir = file.path("/home/sb/dexseq/")
#running locally
indir = file.path("/Users/sbhatia/Documents/sjdata/alternative_splicing/alt_splicing_star/dexseq/dexseq")
countFiles = list.files(indir, pattern = "txt$", full.names = "TRUE")
flattenedFile = list.files(indir, pattern="gff$", full.names=TRUE)
sampleTable = read.csv("/Users/sbhatia/Documents/sjdata/alternative_splicing/alt_splicing_star/dexseq/dexseq/h2az_colnames.csv")
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

plotMA( dxr1, cex=0.8 )
plotDEXSeq( dxr1, "ENSG00000115414", legend=TRUE, cex.axis=1.2, cex=1.3,lwd=2 )
plotDEXSeq( dxr1, "ENSG00000091409", legend=TRUE, cex.axis=1.2, cex=1.3,lwd=2 )
plotDEXSeq( dxr1, "ENSG00000115414", displayTranscripts=TRUE, legend=TRUE,cex.axis=1.2, cex=1.3, lwd=2 )
plotDEXSeq( dxr1, "ENSG00000091409", displayTranscripts=TRUE, legend=TRUE,cex.axis=1.2, cex=1.3, lwd=2 )
plotDEXSeq( dxr1, "ENSG00000115414", expression=FALSE, norCounts=TRUE, legend=TRUE, cex.axis=1.2, cex=1.3, lwd=2 )
plotDEXSeq( dxr1, "ENSG00000091409", expression=FALSE, norCounts=TRUE, legend=TRUE, cex.axis=1.2, cex=1.3, lwd=2 )
plotDEXSeq( dxr1, "ENSG00000115414", expression=FALSE, splicing=TRUE,legend=TRUE, cex.axis=1.2, cex=1.3, lwd=2 )
plotDEXSeq( dxr1, "ENSG00000091409", expression=FALSE, splicing=TRUE,legend=TRUE, cex.axis=1.2, cex=1.3, lwd=2 )
