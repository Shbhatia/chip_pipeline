#FASTQC
#STAR alignment
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_100 --readFilesIn /home/sb/h2az/rnaseq/MC_1.fastq.gz /home/sb/h2az/rnaseq/MC_2.fastq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az/star_output/MC/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_100 --readFilesIn /home/sb/h2az/rnaseq/MT_1.fastq.gz /home/sb/h2az/rnaseq/MT_2.fastq.gz --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az/star_output/MT/

#pool together technical replicates (2 lanes)
cat FCC57BPACXX-WHHUMhahEAAARAAPEI-46_L1_1.fq.gz FCC57BPACXX-WHHUMhahEAAARAAPEI-46_L2_1.fq.gz > FCC57BPACXX-WHHUMhahEAAARAAPEI-46_1.fq.gz
cat FCC57BPACXX-WHHUMhahEAAARAAPEI-46_L1_2.fq.gz FCC57BPACXX-WHHUMhahEAAARAAPEI-46_L2_2.fq.gz > FCC57BPACXX-WHHUMhahEAAARAAPEI-46_2.fq.gz

#STAR alignment (rep2)
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_100 --readFilesIn /home/sb/h2az/rnaseq/MC_1.fastq.gz /home/sb/h2az/rnaseq/ --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az/star_output/MC/
/home/sb/programfiles/STAR/source/STAR --runThreadN 18 --genomeDir /home/sb/genome_data/GRCh38/star_index_100 --readFilesIn /home/sb/h2az/rnaseq/MC_1.fastq.gz /home/sb/h2az/rnaseq/ --readFilesCommand zcat --outFileNamePrefix /home/sb/h2az/star_output/MC/

