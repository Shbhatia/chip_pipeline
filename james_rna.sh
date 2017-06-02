#STAR mapping
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/raw_data/S10A_siC_1.fq.gz /home/sb/james/raw_data/S10A_siC_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/star/sic
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_150 --readFilesIn /home/sb/james/raw_data/S10A_siTRIP12_1.fq.gz /home/sb/james/raw_data/S10A_siTRIP12_2.fq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/james/star/sit

#samtools
samtools view -bS Aligned.out.sam > Aligned.out.bam
samtools sort Aligned.out.bam > sorted.bam
samtools index -b sorted.bam

#Rsubread
