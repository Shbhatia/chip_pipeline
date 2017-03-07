#Alignment using STAR


#using htseq-count and DESeq2
#htseq-count SiC
htseq-count -f bam -r pos --stranded=no /home/sb/star_output/mc_star_output/Aligned.out.bam /home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf
#htseq-count SiT
htseq-count -f bam -r pos --stranded=no /home/sb/star_output/mt_star_output/Aligned.out.bam /home/sb/genome_data/GRCh38/annotation/Homo_sapiens.GRCh38.77.gtf
#metadata

#
