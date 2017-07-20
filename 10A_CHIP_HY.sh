#mark duplicates - Picard
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/10A_CHIP/star_output/Ac-0/ac0_duplicates.txt INPUT=/home/sb/10A_CHIP/star_output/Ac-0/ac0_sorted.bam OUTPUT=/home/sb/10A_CHIP/star_output/Ac-0/ac0_nodup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/10A_CHIP/star_output/Ac-4/ac4_duplicates.txt INPUT=/home/sb/10A_CHIP/star_output/Ac-4/ac4_sorted.bam OUTPUT=/home/sb/10A_CHIP/star_output/Ac-4/ac4_nodup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/10A_CHIP/star_output/Ac-4/ac4_duplicates.txt INPUT=/home/sb/10A_CHIP/star_output/Ac-24/ac24_sorted.bam OUTPUT=/home/sb/10A_CHIP/star_output/Ac-24/ac24_nodup.bam

java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/10A_CHIP/star_output/Me-0/me0_duplicates.txt INPUT=/home/sb/10A_CHIP/star_output/Me-0/me0_sorted.bam OUTPUT=/home/sb/10A_CHIP/star_output/Me-0/me0_nodup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/10A_CHIP/star_output/Me-4/me4_duplicates.txt INPUT=/home/sb/10A_CHIP/star_output/Me-4/me4_sorted.bam OUTPUT=/home/sb/10A_CHIP/star_output/Me-4/me4_nodup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/10A_CHIP/star_output/Me-24/me24_duplicates.txt INPUT=/home/sb/10A_CHIP/star_output/Me-24/me24_sorted.bam OUTPUT=/home/sb/10A_CHIP/star_output/Me-24/me24_nodup.bam

java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/10A_CHIP/star_output/In-0/in0_duplicates.txt INPUT=/home/sb/10A_CHIP/star_output/In-0/in0_sorted.bam OUTPUT=/home/sb/10A_CHIP/star_output/In-0/in0_nodup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/10A_CHIP/star_output/In-4/in4_duplicates.txt INPUT=/home/sb/10A_CHIP/star_output/In-4/in4_sorted.bam OUTPUT=/home/sb/10A_CHIP/star_output/In-4/in4_nodup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/10A_CHIP/star_output/In-24/in24_duplicates.txt INPUT=/home/sb/10A_CHIP/star_output/In-24/in24_sorted.bam OUTPUT=/home/sb/10A_CHIP/star_output/In-24/in24_nodup.bam

java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/10A_CHIP/star_output/H3-0/h30_duplicates.txt INPUT=/home/sb/10A_CHIP/star_output/H3-0/h30_sorted.bam OUTPUT=/home/sb/10A_CHIP/star_output/H3-0/h30_nodup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/10A_CHIP/star_output/H3-4/h34_duplicates.txt INPUT=/home/sb/10A_CHIP/star_output/H3-4/h34_sorted.bam OUTPUT=/home/sb/10A_CHIP/star_output/H3-4/h34_nodup.bam
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/10A_CHIP/star_output/H3-24/h324_duplicates.txt INPUT=/home/sb/10A_CHIP/star_output/H3-24/h324_sorted.bam OUTPUT=/home/sb/10A_CHIP/star_output/H3-24/h324_nodup.bam

/home/sb/programfiles/deepTools/bin/bamCoverage --bam /home/sb/10A_CHIP/star_output/Me-24/me24_nodup_sorted.bam --binSize 10 --normalizeTo1x 3088286401 -o /home/sb/10A_CHIP/star_output/Me-24/me24.bw

bedtools bamtobed -i me4_nodup_sorted.bam > me4_nodup_sorted.bed
sed 's/^/chr/' me4_nodup_sorted.bed > me4_nodup_sorted_chr.bed
grep -v "chrMT" me4_nodup_sorted_chr.bed > me4_nodup_sorted_chr_MT.bed

diffReps.pl --treatment /home/sb/10A_CHIP/star_output/Ac-4/ac4_nodup_sorted_chr_MT.bed --control /home/sb/10A_CHIP/star_output/Ac-0/ac0_nodup_sorted_chr_MT.bed --report /home/sb/10A_CHIP/ac4vs0_sharp.txt --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/10A_CHIP/star_output/In-4/in4_nodup_sorted_chr_MT.bed --bco /home/sb/10A_CHIP/star_output/In-0/in0_nodup_sorted_chr_MT.bed --meth gt --nsd sharp --noanno --nohs --frag 0 --nproc 17
diffReps.pl --treatment /home/sb/10A_CHIP/star_output/Ac-24/ac24_nodup_sorted_chr_MT.bed --control /home/sb/10A_CHIP/star_output/Ac-0/ac0_nodup_sorted_chr_MT.bed --report /home/sb/10A_CHIP/ac24vs0_sharp.txt --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/10A_CHIP/star_output/In-24/in24_nodup_sorted_chr_MT.bed --bco /home/sb/10A_CHIP/star_output/In-0/in0_nodup_sorted_chr_MT.bed --meth gt --nsd sharp --noanno --nohs --frag 0 --nproc 17

diffReps.pl --treatment /home/sb/10A_CHIP/star_output/Me-4/me4_nodup_sorted_chr_MT.bed --control /home/sb/10A_CHIP/star_output/Me-0/me0_nodup_sorted_chr_MT.bed --report /home/sb/10A_CHIP/me4vs0_output.txt --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/10A_CHIP/star_output/In-4/in4_nodup_sorted_chr_MT.bed --bco /home/sb/10A_CHIP/star_output/In-0/in0_nodup_sorted_chr_MT.bed --meth gt --nsd sharp --noanno --nohs --frag 0 --nproc 17
diffReps.pl --treatment /home/sb/10A_CHIP/star_output/Me-24/me24_nodup_sorted_chr_MT.bed --control /home/sb/10A_CHIP/star_output/Me-0/me0_nodup_sorted_chr_MT.bed --report /home/sb/10A_CHIP/me24vs0_output.txt --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/10A_CHIP/star_output/In-4/in4_nodup_sorted_chr_MT.bed --bco /home/sb/10A_CHIP/star_output/In-0/in0_nodup_sorted_chr_MT.bed --meth gt --nsd sharp --noanno --nohs --frag 0 --nproc 17

grep -v "#" me4vs0_output.txt | awk -F"\t" '{if ($13<0.05) print $1"\t"$2"\t"$3"\t"$11"\t"$12"\t"$13}' - > me4vs0_p0.05.bed
awk -F"\t" '{if ($5>1) print $0}' me4vs0_p0.05.bed > me4vs0_p0.05_lgfc1_UP.bed
awk -F"\t" '{if ($5<-1) print $0}' me4vs0_p0.05.bed > me4vs0_p0.05_lgfc1_DOWN.bed
cut -f1,2,3 me4vs0_p0.05_lgfc1_UP.bed > me4vs0_p0.05_lgfc1_UP_IGV.bed
cut -f1,2,3 me4vs0_p0.05_lgfc1_DOWN.bed > me4vs0_p0.05_lgfc1_DOWN_IGV.bed

grep -v "#" me24vs0_output.txt | awk -F"\t" '{if ($13<0.05) print $1"\t"$2"\t"$3"\t"$11"\t"$12"\t"$13}' - > me24vs0_p0.05.bed
awk -F"\t" '{if ($5>1) print $0}' me24vs0_p0.05.bed > me24vs0_p0.05_lgfc1_UP.bed
awk -F"\t" '{if ($5<-1) print $0}' me24vs0_p0.05.bed > me24vs0_p0.05_lgfc1_DOWN.bed
cut -f1,2,3 me24vs0_p0.05_lgfc1_UP.bed > me24vs0_p0.05_lgfc1_UP_IGV.bed
cut -f1,2,3 me24vs0_p0.05_lgfc1_DOWN.bed > me24vs0_p0.05_lgfc1_DOWN_IGV.bed
