#Alignment using STAR


#using htseq-count and DESeq2
#htseq-count SiC
htseq-count -f bam -r pos --stranded=no /home/sb/shainan/rnaseq/staroutput/hep3b_sik/sorted.bam /home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf
htseq-count -f bam -r pos --stranded=no /home/sb/shainan/rnaseq/staroutput/hep3b_sic/sorted.bam /home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf
htseq-count -f bam -r pos --stranded=no /home/sb/shainan/rnaseq/staroutput/lo2_dmso/sorted.bam /home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf
htseq-count -f bam -r pos --stranded=no /home/sb/shainan/rnaseq/staroutput/lo2_jq1/sorted.bam /home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf


#metadata - sample list table as dataframe in R


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

samtools view -bS Aligned.out.sam > Aligned.out.bam



#R-script
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
