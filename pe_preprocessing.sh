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

#H3-2

#H3-3

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

##Me-2 

##Me-3



##samtools sort and index
samtools sort no_dup.bam > sorted2.bam
samtools index -b sorted2.bam

#MACS2
##Ac-1 & Input-1
macs2 callpeak -t /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/sorted_n.bam -c /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/star_output/sorted_n.bam -f BAMPE —g 3.08e9 -n h3k27ac_0h --broad --q 0.05 --outdir /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/macs_out
##Ac-2 & Input-2
macs2 callpeak -t /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output/sorted_n.bam -c /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/star_output/sorted_n.bam -f BAMPE —g 3.08e9 -n h3k27ac_4h --broad --q 0.05 --outdir /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/macs_out
##Ac-3 & Input-3
macs2 callpeak -t /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/sorted2.bam -c /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/star_output/sorted2.bam -f BAMPE —g 3.08e9 -n h3k27ac_4h --broad --q 0.05 --outdir /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/macs_out

