#Fastqc to check fq file quality
fastqc /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/raw_data/FCHCYFGBBXX_L1_wHAPPI040291-15_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/raw_data/FCHCYFGBBXX_L1_wHAPPI040291-15_2.fq
fastqc /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/raw_data/FCHCYFGBBXX_L1_wHAPPI040299-16_1.fq /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/raw_data/FCHCYFGBBXX_L1_wHAPPI040299-16_2.fq

#STAR index generation
programfiles/STAR/source/STAR --runThreadN 20 --runMode genomeGenerate --genomeDir genome_data/GRCh38/star_index_noann --genomeFastaFiles genome_data/GRCh38/sequence/ensembl/GRCh38_r77.all.fa
#hg19
programfiles/STAR/source/STAR --runThreadN 20 --runMode genomeGenerate --genomeDir genome_data/GRCh37/star_index_noannot --genomeFastaFiles genome_data/GRCh37/sequence/GRCh37_r75.all.fa

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
#H3K36me3
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/h3k36me3/ENCSR610IYQ/ENCFF082PFU.fastq  --outFileNamePrefix /home/sb/grace/encode_data/h3k36me3/ENCSR610IYQ/star_output/r1 --alignEndsType EndToEnd
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/h3k36me3/ENCSR610IYQ/ENCFF819ITL.fastq  --outFileNamePrefix /home/sb/grace/encode_data/h3k36me3/ENCSR610IYQ/star_output/r2 --alignEndsType EndToEnd
#H3K9ac
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/h3k9ac/ENCSR056UBA/ENCFF815TBB.fastq  --outFileNamePrefix /home/sb/grace/encode_data/h3k9ac/ENCSR056UBA/star_output/r1 --alignEndsType EndToEnd
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/h3k9ac/ENCSR056UBA/ENCFF921PCJ.fastq --outFileNamePrefix /home/sb/grace/encode_data/h3k9ac/ENCSR056UBA/star_output/r2 --alignEndsType EndToEnd
#H3K4me2
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/h3k4me2/ENCSR875KOJ/ENCFF002AUN.fastq  --outFileNamePrefix /home/sb/grace/encode_data/h3k4me2/ENCSR875KOJ/star_output/r1 --alignEndsType EndToEnd
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/h3k4me2/ENCSR875KOJ/ENCFF870LBH.fastq  --outFileNamePrefix /home/sb/grace/encode_data/h3k4me2/ENCSR875KOJ/star_output/r2 --alignEndsType EndToEnd
#DNase
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/dnase/ENCSR000EPJ/ENCFF001DYT.fastq  --outFileNamePrefix /home/sb/grace/encode_data/dnase/ENCSR000EPJ/star_output/r1 --alignEndsType EndToEnd
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/dnase/ENCSR000EPJ/ENCFF001DZK.fastq  --outFileNamePrefix /home/sb/grace/encode_data/dnase/ENCSR000EPJ/star_output/r2 --alignEndsType EndToEnd
#Input-BB
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/input/bb/ENCFF222VRH.fastq  --outFileNamePrefix /home/sb/grace/encode_data/input/bb/star_output/r1 --alignEndsType EndToEnd
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/input/bb/ENCFF318ZNB.fastq  --outFileNamePrefix /home/sb/grace/encode_data/input/bb/star_output/r2 --alignEndsType EndToEnd
#Input-JS
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/input/js/ENCFF001HUM.fastq  --outFileNamePrefix /home/sb/grace/encode_data/input/js/star_output --alignEndsType EndToEnd
#Input-RM
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/input/rm/ENCFF000QQG.fastq  --outFileNamePrefix /home/sb/grace/encode_data/input/rm/star_output/r1 --alignEndsType EndToEnd
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/input/rm/ENCFF000QQJ.fastq  --outFileNamePrefix /home/sb/grace/encode_data/input/rm/star_output/r2 --alignEndsType EndToEnd
#H3K4me3
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/h3k4me3/ENCSR985MIB/ENCFF211APE.fastq  --outFileNamePrefix /home/sb/grace/encode_data/h3k4me3/ENCSR985MIB/star_output/r1 --alignEndsType EndToEnd
/home/sb/programfiles/STAR/source/STAR   --runThreadN 25   --genomeDir /home/sb/genome_data/GRCh38/star_index_noann  --readFilesIn /home/sb/grace/encode_data/h3k4me3/ENCSR985MIB/ENCFF923ABZ.fastq  --outFileNamePrefix /home/sb/grace/encode_data/h3k4me3/ENCSR985MIB/star_output/r2 --alignEndsType EndToEnd



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
##h3k36me3
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/h3k36me3/ENCSR610IYQ/star_output/r1duplicates.txt INPUT=/home/sb/grace/encode_data/h3k36me3/ENCSR610IYQ/star_output/r1sorted1.bam OUTPUT=/home/sb/grace/encode_data/h3k36me3/ENCSR610IYQ/star_output/r1no_dup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/h3k36me3/ENCSR610IYQ/star_output/r2duplicates.txt INPUT=/home/sb/grace/encode_data/h3k36me3/ENCSR610IYQ/star_output/r2sorted1.bam OUTPUT=/home/sb/grace/encode_data/h3k36me3/ENCSR610IYQ/star_output/r2no_dup.bam
##h3k27me3
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/h3k27me3/ENCSR761DLU/star_output/r1duplicates.txt INPUT=/home/sb/grace/encode_data/h3k27me3/ENCSR761DLU/star_output/r1sorted.bam OUTPUT=/home/sb/grace/encode_data/h3k27me3/ENCSR761DLU/star_output/r1no_dup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/h3k27me3/ENCSR761DLU/star_output/r2duplicates.txt INPUT=/home/sb/grace/encode_data/h3k27me3/ENCSR761DLU/star_output/r2sorted.bam OUTPUT=/home/sb/grace/encode_data/h3k27me3/ENCSR761DLU/star_output/r2no_dup.bam
#h3k4me2
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/h3k4me2/ENCSR875KOJ/star_output/r1duplicates.txt INPUT=/home/sb/grace/encode_data/h3k4me2/ENCSR875KOJ/star_output/r1sorted1.bam OUTPUT=/home/sb/grace/encode_data/h3k4me2/ENCSR875KOJ/star_output/r1no_dup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/h3k4me2/ENCSR875KOJ/star_output/r2duplicates.txt INPUT=/home/sb/grace/encode_data/h3k4me2/ENCSR875KOJ/star_output/r2sorted1.bam OUTPUT=/home/sb/grace/encode_data/h3k4me2/ENCSR875KOJ/star_output/r2no_dup.bam
##Input-BB
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/input/bb/star_output/r1duplicates.txt INPUT=/home/sb/grace/encode_data/input/bb/star_output/r1sorted1.bam OUTPUT=/home/sb/grace/encode_data/input/bb/star_output/r1no_dup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/input/bb/star_output/r2duplicates.txt INPUT=/home/sb/grace/encode_data/input/bb/star_output/r2sorted1.bam OUTPUT=/home/sb/grace/encode_data/input/bb/star_output/r2no_dup.bam
##Input-JS
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/input/js/star_output/duplicates.txt INPUT=/home/sb/grace/encode_data/input/js/star_output/sorted1.bam OUTPUT=/home/sb/grace/encode_data/input/js/star_output/no_dup.bam
##Input-RM
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/input/rm/star_output/r1duplicates.txt INPUT=/home/sb/grace/encode_data/input/rm/star_output/r1sorted1.bam OUTPUT=/home/sb/grace/encode_data/input/rm/star_output/r1no_dup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/input/rm/star_output/r2duplicates.txt INPUT=/home/sb/grace/encode_data/input/rm/star_output/r2sorted1.bam OUTPUT=/home/sb/grace/encode_data/input/rm/star_output/r2no_dup.bam
##DNAse
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/dnase/ENCSR000EPJ/star_output/r1duplicates.txt INPUT=/home/sb/grace/encode_data/dnase/ENCSR000EPJ/star_output/r1sorted1.bam OUTPUT=/home/sb/grace/encode_data/dnase/ENCSR000EPJ/star_output/r1no_dup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/dnase/ENCSR000EPJ/star_output/r2duplicates.txt INPUT=/home/sb/grace/encode_data/dnase/ENCSR000EPJ/star_output/r2sorted1.bam OUTPUT=/home/sb/grace/encode_data/dnase/ENCSR000EPJ/star_output/r2no_dup.bam
##h3k9ac
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/h3k9ac/ENCSR056UBA/star_output/r1duplicates.txt INPUT=/home/sb/grace/encode_data/h3k9ac/ENCSR056UBA/star_output/r1sorted1.bam OUTPUT=/home/sb/grace/encode_data/h3k9ac/ENCSR056UBA/star_output/r1no_dup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/h3k9ac/ENCSR056UBA/star_output/r2duplicates.txt INPUT=/home/sb/grace/encode_data/h3k9ac/ENCSR056UBA/star_output/r2sorted1.bam OUTPUT=/home/sb/grace/encode_data/h3k9ac/ENCSR056UBA/star_output/r2no_dup.bam
#h3k4me3
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/h3k4me3/ENCSR985MIB/star_output/r1duplicates.txt INPUT=/home/sb/grace/encode_data/h3k4me3/ENCSR985MIB/star_output/r1sorted.bam OUTPUT=/home/sb/grace/encode_data/h3k4me3/ENCSR985MIB/star_output/r1no_dup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/grace/encode_data/h3k4me3/ENCSR985MIB/star_output/r2duplicates.txt INPUT=/home/sb/grace/encode_data/h3k4me3/ENCSR985MIB/star_output/r2sorted.bam OUTPUT=/home/sb/grace/encode_data/h3k4me3/ENCSR985MIB/star_output/r2no_dup.bam

##samtools sort and index
samtools sort no_dup.bam > sorted2.bam
samtools index -b sorted2.bam

#MACS2 q=0.05
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
#MACS2 q=0.01
macs2 callpeak -t /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/sorted_n.bam -c /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/star_output/sorted_n.bam -f BAMPE —g 3.08e9 -n h3k27ac_0h --broad --q 0.01 --outdir /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/macs_out_q0.01
macs2 callpeak -t /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output/sorted_n.bam -c /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/star_output/sorted_n.bam -f BAMPE —g 3.08e9 -n h3k27ac_4h --broad --q 0.01 --outdir /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/macs_out_q0.01
macs2 callpeak -t /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/sorted_n.bam -c /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/star_output/sorted_n.bam -f BAMPE —g 3.08e9 -n h3k27ac_24h --broad --q 0.01 --outdir /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/macs_out_q0.01
macs2 callpeak -t /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-1/star_output/sorted_n.bam -c /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/star_output/sorted_n.bam -f BAMPE —g 3.08e9 -n me_0h --broad --q 0.01 --outdir /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-1/macs_out_q0.01
macs2 callpeak -t /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-2/star_output/sorted_n.bam -c /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/star_output/sorted_n.bam -f BAMPE —g 3.08e9 -n me_4h --broad --q 0.01 --outdir /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-2/macs_out_q0.01
macs2 callpeak -t /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-3/star_output/sorted_n.bam -c /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/star_output/sorted_n.bam -f BAMPE —g 3.08e9 -n me_24h --broad --q 0.01 --outdir /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-3/macs_out_q0.01






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

#HOMER make tag directory
#H3K27ac
makeTagDirectory /home/sb/grace/homer/h3k27ac-0h-ChIP-Seq/ /home/sb/grace/chromhmm/inputdir/mcf7_h3k27ac.bam
makeTagDirectory /home/sb/grace/homer/h3k4me1-0h-ChIP-Seq/ /home/sb/grace/chromhmm/inputdir/mcf7_h3k4me1.bam

makeTagDirectory /home/sb/grace/homer/h3k27ac-4h-ChIP-Seq/ /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output/sorted2.bam
makeTagDirectory /home/sb/grace/homer/h3k27ac-24h-ChIP-Seq/ /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/sorted2.bam

makeTagDirectory /home/sb/grace/homer/h3k4me1-4h-ChIP-Seq/ /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-2/star_output/sorted2.bam
makeTagDirectory /home/sb/grace/homer/h3k4me1-24h-ChIP-Seq/ /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Me-3/star_output/sorted2.bam

#Input
makeTagDirectory /home/sb/grace/homer/Control-ChIP-Seq/ /home/sb/grace/chromhmm/inputdir/gc_input.bam
makeTagDirectory /home/sb/grace/homer/Control-4h-ChIP-Seq/ /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/star_output/sorted2.bam
makeTagDirectory /home/sb/grace/homer/Control-24h-ChIP-Seq/ /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/star_output/sorted2.bam


#HOMER findpeaks
findPeaks /home/sb/grace/homer/h3k27ac-0h-ChIP-Seq/ -style histone -o auto -i /home/sb/grace/homer/Control-ChIP-Seq/
findPeaks /home/sb/grace/homer/h3k27ac-4h-ChIP-Seq/ -style histone -o auto -i /home/sb/grace/homer/Control-4h-ChIP-Seq/
findPeaks /home/sb/grace/homer/h3k27ac-24h-ChIP-Seq/ -style histone -o auto -i /home/sb/grace/homer/Control-24h-ChIP-Seq/
findPeaks /home/sb/grace/homer/h3k4me1-0h-ChIP-Seq/ -style histone -o auto -i /home/sb/grace/homer/Control-0h-ChIP-Seq/
findPeaks /home/sb/grace/homer/h3k4me1-4h-ChIP-Seq/ -style histone -o auto -i /home/sb/grace/homer/Control-4h-ChIP-Seq/
findPeaks /home/sb/grace/homer/h3k4me1-24h-ChIP-Seq/ -style histone -o auto -i /home/sb/grace/homer/Control-24h-ChIP-Seq/
findPeaks /home/sb/grace/homer/h3k27ac-0h-ChIP-Seq/ -style super -o auto -typical typical.txt -i /home/sb/grace/homer/Control-0h-ChIP-Seq/
findPeaks /home/sb/grace/homer/h3k27ac-4h-ChIP-Seq/ -style super -typical typical.txt -L 0 -o auto -i /home/sb/grace/homer/Control-4h-ChIP-Seq/
findPeaks /home/sb/grace/homer/h3k27ac-24h-ChIP-Seq/ -style super -typical /home/sb/grace/homer/h3k27ac-24h-ChIP-Seq/typical.txt -L 0 -o auto -i /home/sb/grace/homer/Control-24h-ChIP-Seq/

#homer-output processing bed file
cut -f2,3,4,5 regions.txt | grep -v '^#' - | awk '{OFS="\t"; if ($4=="+") {print} else {print $1,$3,$2,$4}}' - > h3k27ac_homer.bed
cut -f2,3,4,5 regions.txt | grep -v '^#' - | awk '{OFS="\t"; if ($4=="+") {print} else {print $1,$3,$2,$4}}' - > h3k4me1_homer.bed
