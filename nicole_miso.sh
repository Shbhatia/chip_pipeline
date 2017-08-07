#star run
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_100_ucsc --readFilesIn /home/sb/transsplicing/SIC_HELA/FCH3YKTBBXX-HKRDHUMayfEAACRAAPEI-203_1.fq.gz /home/sb/transsplicing/SIC_HELA/FCH3YKTBBXX-HKRDHUMayfEAACRAAPEI-203_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/transsplicing/star_output/sic_star/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_100_ucsc --readFilesIn /home/sb/transsplicing/SIE6_HELA/FCH3YKTBBXX-HKRDHUMayfEAADRAAPEI-204_1.fq.gz /home/sb/transsplicing/SIE6_HELA/FCH3YKTBBXX-HKRDHUMayfEAADRAAPEI-204_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/transsplicing/star_output/sie6_star/

#samtools
samtools view -bS Aligned.out.sam > Aligned.out.bam 
samtools sort Aligned.out.bam > sorted.bam 
samtools index -b sorted.bam

#miso
