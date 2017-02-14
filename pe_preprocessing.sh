#Fastqc to check fq file quality
fastqc /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/raw_data/FCHCYFGBBXX_L1_wHAPPI040291-15_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/raw_data/FCHCYFGBBXX_L1_wHAPPI040291-15_2.fq
fastqc /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/raw_data/FCHCYFGBBXX_L1_wHAPPI040299-16_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/raw_data/FCHCYFGBBXX_L1_wHAPPI040299-16_2.fq

#STAR index generation
programfiles/STAR/source/STAR --runThreadN 20 --runMode genomeGenerate --genomeDir genome_data/GRCh38/star_index_49_noann --genomeFastaFiles genome_data/GRCh38/sequence/ensembl/GRCh38_r77.all.fa —sjdbOverhang 48
programfiles/STAR/source/STAR --runThreadN 20 --runMode genomeGenerate --genomeDir genome_data/GRCh38/star_index_36_noann --genomeFastaFiles genome_data/GRCh38/sequence/ensembl/GRCh38_r77.all.fa —sjdbOverhang 35

#STAR alignment
#Ac-1
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/raw_data/FCHCYFGBBXX_L1_wHAPPI040291-15_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/raw_data/FCHCYFGBBXX_L1_wHAPPI040291-15_2.fq --outFileNamePrefix /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output --alignEndsType EndToEnd
#Ac-2
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/raw_data/FCHCYFGBBXX_L1_wHAPPI040299-16_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/raw_data/FCHCYFGBBXX_L1_wHAPPI040299-16_2.fq --outFileNamePrefix /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output --alignEndsType EndToEnd
#Ac-3
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/raw_data/FCHCYFGBBXX_L1_wHAPPI040302-17_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/raw_data/FCHCYFGBBXX_L1_wHAPPI040302-17_2.fq --outFileNamePrefix /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output --alignEndsType EndToEnd
#Input-1
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/raw_data/FCHCYFGBBXX_L1_wHAPPI040295-8_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/raw_data/FCHCYFGBBXX_L1_wHAPPI040295-8_2.fq --outFileNamePrefix /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/star_output/ --alignEndsType EndToEnd
#Input-2
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/raw_data/FCHCYFGBBXX_L1_wHAPPI040296-9_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/raw_data/FCHCYFGBBXX_L1_wHAPPI040296-9_2.fq --outFileNamePrefix /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/star_output/ --alignEndsType EndToEnd
#Input-3
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/raw_data/FCHCYFGBBXX_L1_wHAPPI040298-11_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/raw_data/FCHCYFGBBXX_L1_wHAPPI040298-11_2.fq --outFileNamePrefix /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/star_output/ --alignEndsType EndToEnd
#Me-1
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-1/raw_data/FCHCYFKBBXX_L4_wHAPPI040297-18_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-1/raw_data/FCHCYFKBBXX_L4_wHAPPI040297-18_2.fq --outFileNamePrefix /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-1/star_output/ --alignEndsType EndToEnd
#Me-2
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-2/raw_data/FCHCYFKBBXX_L4_wHAPPI040300-21_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-2/raw_data/FCHCYFKBBXX_L4_wHAPPI040300-21_2.fq --outFileNamePrefix /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-2/star_output/ --alignEndsType EndToEnd
#Me-3
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-3/raw_data/FCHCYFKBBXX_L4_wHAPPI040292-23_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-3/raw_data/FCHCYFKBBXX_L4_wHAPPI040292-23_2.fq --outFileNamePrefix /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-3/star_output/ --alignEndsType EndToEnd
#H3-1
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-1/raw_data/FCHCYFKBBXX_L4_wHAPPI040293-12_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-1/raw_data/FCHCYFKBBXX_L4_wHAPPI040293-12_2.fq --outFileNamePrefix /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-1/star_output/ --alignEndsType EndToEnd
#H3-2
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-2/raw_data/FCHCYFKBBXX_L4_wHAPPI040290-13_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-2/raw_data/FCHCYFKBBXX_L4_wHAPPI040290-13_2.fq --outFileNamePrefix /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-2/star_output/ --alignEndsType EndToEnd
#H3-3
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-3/raw_data/FCHCYFKBBXX_L4_wHAPPI040294-14_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-3/raw_data/FCHCYFKBBXX_L4_wHAPPI040294-14_2.fq --outFileNamePrefix /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-3/star_output/ --alignEndsType EndToEnd
#CTCF
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/ctcf/ENCSR000DWH/ENCFF001HUF.fastq  --outFileNamePrefix /home/sb/grace/encode_data/ctcf/ENCSR000DWH/star_output/r1 --alignEndsType EndToEnd
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/ctcf/ENCSR000DWH/ENCFF001HUG.fastq  --outFileNamePrefix /home/sb/grace/encode_data/ctcf/ENCSR000DWH/star_output/r2 --alignEndsType EndToEnd
#P300
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/p300/ENCSR000BTR/ENCFF000QPK.fastq  --outFileNamePrefix /home/sb/grace/encode_data/p300/ENCSR000BTR/star_output/r1 --alignEndsType EndToEnd
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/p300/ENCSR000BTR/ENCFF000QPP.fastq  --outFileNamePrefix /home/sb/grace/encode_data/p300/ENCSR000BTR/star_output/r2 --alignEndsType EndToEnd
#H3K27me3
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/h3k27me3/ENCSR761DLU/ENCFF023EPH.fastq  --outFileNamePrefix /home/sb/grace/encode_data/h3k27me3/ENCSR761DLU/star_output/r1 --alignEndsType EndToEnd
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/h3k27me3/ENCSR761DLU/ENCFF250WAH.fastq  --outFileNamePrefix /home/sb/grace/encode_data/h3k27me3/ENCSR761DLU/star_output/r2 --alignEndsType EndToEnd

#Samtools convert to bam, sort and index
samtools view -bS star_outputAligned.out.sam > Aligned.out.bam
samtools sort Aligned.out.bam > sorted1.bam
samtools index -b sorted1.bam

#Picard - Mark Duplicates
##Ac-1
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/duplicates.txt INPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/sorted1.bam OUTPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/no_dup.bam
##Ac-2
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output/duplicates.txt INPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output/sorted1.bam OUTPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output/no_dup.bam
##Ac-3
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/duplicates.txt INPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/sorted1.bam OUTPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/no_dup.bam
##Input-1
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/star_output/duplicates.txt INPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/star_output/sorted1.bam OUTPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/star_output/no_dup.bam
##Input-2
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/star_output/duplicates.txt INPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/star_output/sorted1.bam OUTPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/star_output/no_dup.bam
##Input-3
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/star_output/duplicates.txt INPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/star_output/sorted1.bam OUTPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/star_output/no_dup.bam
##Me-1
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-1/star_output/duplicates.txt INPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-1/star_output/sorted.bam OUTPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-1/star_output/no_dup.bam
##Me-2 
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-2/star_output/duplicates.txt INPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-2/star_output/sorted.bam OUTPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-2/star_output/no_dup.bam
##Me-3
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-3/star_output/duplicates.txt INPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-3/star_output/sorted.bam OUTPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-3/star_output/no_dup.bam
##H3-1
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-1/star_output/duplicates.txt INPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-1/star_output/sorted1.bam OUTPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-1/star_output/no_dup.bam
##H3-2
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-2/star_output/duplicates.txt INPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-2/star_output/sorted1.bam OUTPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-2/star_output/no_dup.bam
##H3-3
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-3/star_output/duplicates.txt INPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-3/star_output/sorted1.bam OUTPUT=/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-3/star_output/no_dup.bam
##CTCF
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/ctcf/ENCSR000DWH/star_output/r1duplicates.txt INPUT=/home/sb/grace/encode_data/ctcf/ENCSR000DWH/star_output/r1sorted.bam OUTPUT=/home/sb/grace/encode_data/ctcf/ENCSR000DWH/star_output/r1no_dup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/ctcf/ENCSR000DWH/star_output/r2duplicates.txt INPUT=/home/sb/grace/encode_data/ctcf/ENCSR000DWH/star_output/r2sorted.bam OUTPUT=/home/sb/grace/encode_data/ctcf/ENCSR000DWH/star_output/r2no_dup.bam
##p300
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/p300/ENCSR000BTR/star_output/r1duplicates.txt INPUT=/home/sb/grace/encode_data/p300/ENCSR000BTR/star_output/r1sorted.bam OUTPUT=/home/sb/grace/encode_data/p300/ENCSR000BTR/star_output/r1no_dup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/p300/ENCSR000BTR/star_output/r2duplicates.txt INPUT=/home/sb/grace/encode_data/p300/ENCSR000BTR/star_output/r2sorted.bam OUTPUT=/home/sb/grace/encode_data/p300/ENCSR000BTR/star_output/r2no_dup.bam
##h3k27me3
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/h3k27me3/ENCSR761DLU/star_output/r1duplicates.txt INPUT=/home/sb/grace/encode_data/h3k27me3/ENCSR761DLU/star_output/r1sorted.bam OUTPUT=/home/sb/grace/encode_data/h3k27me3/ENCSR761DLU/star_output/r1no_dup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/h3k27me3/ENCSR761DLU/star_output/r2duplicates.txt INPUT=/home/sb/grace/encode_data/h3k27me3/ENCSR761DLU/star_output/r2sorted.bam OUTPUT=/home/sb/grace/encode_data/h3k27me3/ENCSR761DLU/star_output/r2no_dup.bam


##samtools sort and index
samtools sort no_dup.bam > sorted2.bam
samtools index -b sorted2.bam

#MACS2
##Ac-1 & Input-1
macs2 callpeak -t /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/sorted_n.bam -c /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/star_output/sorted_n.bam -f BAMPE —g 3.08e9 -n h3k27ac_0h --broad --q 0.05 --outdir /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/macs_out
##Ac-2 & Input-2
macs2 callpeak -t /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output/sorted_n.bam -c /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/star_output/sorted_n.bam -f BAMPE —g 3.08e9 -n h3k27ac_4h --broad --q 0.05 --outdir /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/macs_out
##Ac-3 & Input-3
macs2 callpeak -t /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/sorted_n.bam -c /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/star_output/sorted_n.bam -f BAMPE —g 3.08e9 -n h3k27ac_24h --broad --q 0.05 --outdir /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/macs_out
##Me-1 vs Input-1
macs2 callpeak -t /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-1/star_output/sorted_n.bam -c /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/star_output/sorted_n.bam -f BAMPE —g 3.08e9 -n me_0h --broad --q 0.05 --outdir /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-1/macs_out
##Me-2 vs Input-2
macs2 callpeak -t /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-2/star_output/sorted_n.bam -c /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/star_output/sorted_n.bam -f BAMPE —g 3.08e9 -n me_4h --broad --q 0.05 --outdir /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-2/macs_out
##Me-3 vs Input-3
macs2 callpeak -t /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-3/star_output/sorted_n.bam -c /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/star_output/sorted_n.bam -f BAMPE —g 3.08e9 -nme_24h --broad --q 0.05 --outdir /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-3/macs_out



#Normalization using deepTools to create bigWig files
#Ac-1
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/sorted2.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/h3k27ac0h_seqdepthnorm.bw
#Ac-2
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output/sorted2.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output/h3k27ac4h_seqdepthnorm.bw
#Ac-3
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/sorted2.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/h3k27ac24h_seqdepthnorm.bw
#Input-1
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/star_output/sorted2.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/star_output/input0h_seqdepthnorm.bw
#Input-2
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/star_output/sorted2.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/star_output/input4h_seqdepthnorm.bw
#Input-3
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/star_output/sorted2.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/star_output/input24h_seqdepthnorm.bw
#Me-1
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-1/star_output/sorted2.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-1/star_output/me0h_seqdepthnorm.bw
#Me-2
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-2/star_output/sorted2.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-2/star_output/me4h_seqdepthnorm.bw
#Me-3
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-3/star_output/sorted2.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-3/star_output/me24h_seqdepthnorm.bw
#H3-1
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-1/star_output/sorted2.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-1/star_output/h30h_seqdepthnorm.bw
#H3-2
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-2/star_output/sorted2.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-2/star_output/h34h_seqdepthnorm.bw
#H3-3
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-3/star_output/sorted2.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/H3-3/star_output/h324h_seqdepthnorm.bw



#BamtoBed for diffReps input file
bedtools bamtobed -bedpe -i sorted_n.bam > sorted_n.bed
cut -f1,2,6,7,8,9,10 sorted_n.bed > diff_input.bed
sed 's/^/chr/' diff_input.bed > new_diffin.bed
grep -v "chrMT" new_diffin.bed > nomt.bed


#diffReps
#Ac-2 vs. Ac-1
diffReps.pl --treatment /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output/nomt.bed --control /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/nomt.bed --report /home/sb/grace/chip/diffreps_output/ac2vs1_output --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/star_output/nomt.bed --bco /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/star_output/nomt.bed --meth gt --nsd broad --noanno --nohs --frag 0 --nproc 17
#Ac-3 vs. Ac-2
diffReps.pl --treatment /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/nomt.bed --control /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output/nomt.bed --report /home/sb/grace/chip/diffreps_output/ac3vs2_output --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/star_output/nomt.bed --bco /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/star_output/nomt.bed --meth gt --nsd broad --noanno --nohs --frag 0 --nproc 17
#Ac-3 vs. Ac-1
diffReps.pl --treatment /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/nomt.bed --control /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/nomt.bed --report /home/sb/grace/chip/diffreps_output/ac3vs1_output --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/star_output/nomt.bed --bco /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/star_output/nomt.bed --meth gt --nsd broad --noanno --nohs --frag 0 --nproc 17
#Me-2 vs. Me-1
diffReps.pl --treatment /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-2/star_output/nomt.bed --control /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-1/star_output/nomt.bed --report /home/sb/grace/chip/diffreps_output/me2vs1_output --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/star_output/nomt.bed --bco /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/star_output/nomt.bed --meth gt --nsd broad --noanno --nohs --frag 0 --nproc 17
#Me-3 vs. Me-2
diffReps.pl --treatment /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-3/star_output/nomt.bed --control /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-2/star_output/nomt.bed --report /home/sb/grace/chip/diffreps_output/me3vs2_output --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/star_output/nomt.bed --bco /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/star_output/nomt.bed --meth gt --nsd broad --noanno --nohs --frag 0 --nproc 17
#Me-3 vs. Me-1
diffReps.pl --treatment /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-3/star_output/nomt.bed --control /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-1/star_output/nomt.bed --report /home/sb/grace/chip/diffreps_output/me3vs1_output --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/star_output/nomt.bed --bco /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/star_output/nomt.bed --meth gt --nsd broad --noanno --nohs --frag 0 --nproc 17


