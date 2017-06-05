#H4 ChIP-seq data analysis pipeline
#Samples: CH4 (H4 ChIP for siCtrl MCF10A), CI (H4 input for siCtrl MCF10A), TH4 (H4 ChIP for siTIP60 MCF10A), TI (H4 input for siTIP60 MCF10A)

#Fastqc to check quality of all fastq files

#Create STAR index

programfiles/STAR/source/STAR --runThreadN 20 --runMode genomeGenerate --genomeDir genome_data/GRCh38/star_index_49_noann --genomeFastaFiles genome_data/GRCh38/sequence/ensembl/GRCh38_r77.all.fa —sjdbOverhang 48

#Run STAR mapping for all fastq files (with end-to-end mapping)

/home/sb/programfiles/STAR/source/STAR   --runThreadN 20   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/mcf10a_chip/ch4/FCH7NN3BBXX-wHAPPI029011-19_L1_1.fq --outFileNamePrefix /home/sb/star_output/ch4_star/ --alignEndsType EndToEnd
/home/sb/programfiles/STAR/source/STAR   --runThreadN 20   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/mcf10a_chip/ci/FCH7NN3BBXX-wHAPPI029019-13_L1_1.fq  --outFileNamePrefix /home/sb/star_output/ci_star/ --alignEndsType EndToEnd
/home/sb/programfiles/STAR/source/STAR   --runThreadN 20   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/mcf10a_chip/th4/ FCH7NN3BBXX-wHAPPI029025-20_L1_1.fq  --outFileNamePrefix /home/sb/star_output/th4_star/ --alignEndsType EndToEnd
/home/sb/programfiles/STAR/source/STAR   --runThreadN 20   --genomeDir /home/sb/genome_data/GRCh38/star_index_49_noann  --readFilesIn /home/sb/mcf10a_chip/ti/FCH7NN3BBXX-wHAPPI029013-14_L1_1.fq    --outFileNamePrefix /home/sb/star_output/ti_star/ --alignEndsType EndToEnd

#sort & index alignment files

samtools view –bS Aligned.out.sam > Aligned.out.bam
samtools sort Aligned.out.sam > sorted.bam
samtools index –b sorted.bam

#Picard tools – remove duplicates

java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/star_output/ch4_star/dup.txt INPUT=/home/sb/star_output/ch4_star/sorted.bam OUTPUT=/home/sb/star_output/ch4_star/new_sorted.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/star_output/ci_star/dup.txt INPUT=/home/sb/star_output/ci_star/sorted.bam OUTPUT=/home/sb/star_output/ci_star/new_sorted.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/star_output/th4_star/dup.txt INPUT=/home/sb/star_output/th4_star/sorted.bam OUTPUT=/home/sb/star_output/th4_star/new_sorted.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/star_output/ti_star/dup.txt INPUT=/home/sb/star_output/ti_star/sorted.bam OUTPUT=/home/sb/star_output/ti_star/new_sorted.bam

#sort & index alignment files

samtools view –bS Aligned.out.sam > Aligned.out.bam
samtools sort Aligned.out.sam > sorted.bam
samtools index –b sorted.bam

#Calculation of genome size (hg38)

epic-effective --read-length 47 --nb-cpu 15 /home/sb/genome_data/GRCh38/sequence/ensembl/GRCh38_r77.all.fa

Genome size calculated (hg38) = 3088286401

#MACS2 – peak calling

macs2 callpeak -t star_output/ch4_star/new_sort.bam -c star_output/ci_star/new_sort.bam —g 3.08e9 -n h4_sic --nomodel --ext size 147 --broad --q 0.05 --outdir /home/sb/macs/ch4_macs
macs2 callpeak -t star_output/th4_star/sorted.bam -c star_output/ti_star/sorted.bam --g 3.08e9 -n h4_sic --nomodel --ext size 147  --broad -q 0.05 --outdir /home/sb/macs/th4_macs


#create bigwig
/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/star_output/ca416_star/new_sorted.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/star_output/ca416_star/ca416_seqdepthnorm.bw

