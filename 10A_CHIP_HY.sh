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

diffReps.pl --treatment /home/sb/10A_CHIP/star_output/Ac-4/ac4_nodup_sorted_chr_MT.bed --control /home/sb/10A_CHIP/star_output/Ac-0/ac0_nodup_sorted_chr_MT.bed --report /home/sb/10A_CHIP/ac4vs0_output.txt --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/10A_CHIP/star_output/In-4/in4_nodup_sorted_chr_MT.bed --bco /home/sb/10A_CHIP/star_output/In-0/in0_nodup_sorted_chr_MT.bed --meth gt --nsd broad --noanno --nohs --frag 0 --nproc 17
diffReps.pl --treatment /home/sb/10A_CHIP/star_output/Ac-24/ac24_nodup_sorted_chr_MT.bed --control /home/sb/10A_CHIP/star_output/Ac-0/ac0_nodup_sorted_chr_MT.bed --report /home/sb/10A_CHIP/ac24vs0_output.txt --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/10A_CHIP/star_output/In-24/in24_nodup_sorted_chr_MT.bed --bco /home/sb/10A_CHIP/star_output/In-0/in0_nodup_sorted_chr_MT.bed --meth gt --nsd broad --noanno --nohs --frag 0 --nproc 17