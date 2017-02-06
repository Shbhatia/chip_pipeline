#Fastqc to check fq file quality
fastqc /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/raw_data/FCHCYFGBBXX_L1_wHAPPI040291-15_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/raw_data/FCHCYFGBBXX_L1_wHAPPI040291-15_2.fq
fastqc /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/raw_data/FCHCYFGBBXX_L1_wHAPPI040299-16_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/raw_data/FCHCYFGBBXX_L1_wHAPPI040299-16_2.fq

#STAR index generation
programfiles/STAR/source/STAR --runThreadN 20 --runMode genomeGenerate --genomeDir genome_data/GRCh38/star_index_49_noann --genomeFastaFiles genome_data/GRCh38/sequence/ensembl/GRCh38_r77.all.fa —sjdbOverhang 48

#STAR alignment
#Ac-1
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/raw_data/FCHCYFGBBXX_L1_wHAPPI040291-15_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/raw_data/FCHCYFGBBXX_L1_wHAPPI040291-15_2.fq --outFileNamePrefix /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output --alignEndsType EndToEnd
#Ac-2
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/raw_data/FCHCYFGBBXX_L1_wHAPPI040299-16_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/raw_data/FCHCYFGBBXX_L1_wHAPPI040299-16_2.fq --outFileNamePrefix /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output --alignEndsType EndToEnd
#Ac-3
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/raw_data/FCHCYFGBBXX_L1_wHAPPI040302-17_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/raw_data/FCHCYFGBBXX_L1_wHAPPI040302-17_2.fq --outFileNamePrefix /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output --alignEndsType EndToEnd
#Input-1

#Input-2

#Input-3

#Me-1

#Me-2

#Me-3

#H3-1

#H3-2

#H3-3

#Samtools convert to bam, sort and index
samtools view -bS star_outputAligned.out.sam > Aligned.out.bam
samtools sort Aligned.out.bam > sorted1.bam
samtools index -b sorted1.bam

#Picard - Mark Duplicates
