programfiles/STAR/source/STAR --runThreadN 20 --runMode genomeGenerate --genomeDir genome_data/GRCh38/star_index_noann --genomeFastaFiles genome_data/GRCh38/sequence/ensembl/GRCh38_r77.all.fa

/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/shweta/CLIP/SRR034466.fastq --outFileNamePrefix /home/sb/shweta/CLIP/SRR034466/ --alignEndsType EndToEnd

/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/shweta/CLIP/SRR034466/SRR034466_sorted.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/shweta/CLIP/SRR034466.bw
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/shweta/CLIP/SRR034467/SRR034467_sorted.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/shweta/CLIP/SRR034467.bw
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/shweta/CLIP/SRR034468/SRR034468_sorted.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/shweta/CLIP/SRR034468.bw
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/shweta/CLIP/SRR034469/SRR034469_sorted.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/shweta/CLIP/SRR034469.bw
