#Alignment using STAR


#using htseq-count and DESeq2
#htseq-count SiC
htseq-count -f bam -r pos --stranded=no /home/sb/star_output/mc_star_output/Aligned.out.bam /home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf
#htseq-count SiT
htseq-count -f bam -r pos --stranded=no /home/sb/star_output/mt_star_output/Aligned.out.bam /home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf
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





#STAR index generation
/home/sb/programfiles/STAR/source/STAR --runThreadN 17 --runMode genomeGenerate --genomeDir genome_data/GRCh38/star_index_150 --genomeFastaFiles /home/sb/genome_data/GRCh38/sequence/ensembl/GRCh38_r77.all.fa --sjdbGTFfile /home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf --sjdbOverhang 149
#STAR alignment of RNASeq reads (150bp)

