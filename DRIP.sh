#Mapping with BWA
programfiles/bwa/bwa index genome_data/GRCh38/sequence/GRCh38_r77.all.fa

programfiles/bwa/bwa mem -M -t 25 genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP/C101HW18101721/raw_data/SIC_CYTO_1.fq.gz /home/sb/DRIP/C101HW18101721/raw_data/SIC_CYTO_2.fq.gz > /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_CYTO.sam

programfiles/bwa/bwa mem -M -t 25 genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP/C101HW18101721/raw_data/SIC_CYTO_IN_1.fq.gz /home/sb/DRIP/C101HW18101721/raw_data/SIC_CYTO_IN_2.fq.gz > /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_CYTO_IN.sam

programfiles/bwa/bwa mem -M -t 25 genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP/C101HW18101721/raw_data/SIT_CYTO_1.fq.gz /home/sb/DRIP/C101HW18101721/raw_data/SIT_CYTO_2.fq.gz > /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIT_CYTO_1.sam

programfiles/bwa/bwa mem -M -t 25 genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP/C101HW18101721/raw_data/SIT_CYTO_IN_1.fq.gz /home/sb/DRIP/C101HW18101721/raw_data/SIT_CYTO_IN_2.fq.gz > /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIT_CYTO_IN_1.sam

programfiles/bwa/bwa mem -M -t 25 genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP/C101HW18101721/raw_data/SIC_NUC_1.fq.gz /home/sb/DRIP/C101HW18101721/raw_data/SIC_NUC_2.fq.gz > /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_NUC.sam

programfiles/bwa/bwa mem -M -t 25 genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP/C101HW18101721/raw_data/SIT_NUC_1.fq.gz /home/sb/DRIP/C101HW18101721/raw_data/SIT_NUC_2.fq.gz > /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIT_NUC.sam

programfiles/bwa/bwa mem -M -t 30 genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP/C101HW18101721/raw_data/SIC_NUC_IN_1.fq.gz /home/sb/DRIP/C101HW18101721/raw_data/SIC_NUC_IN_2.fq.gz > /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_NUC_IN.sam

programfiles/bwa/bwa mem -M -t 30 genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP/C101HW18101721/raw_data/SIT_NUC_IN_1.fq.gz /home/sb/DRIP/C101HW18101721/raw_data/SIT_NUC_IN_2.fq.gz > /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIT_NUC_IN.sam

#MarkDuplicates - PICARD
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/DRIP/C101HW18101721/raw_data/SIC_CYTO_duplicates.txt INPUT=/home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_CYTO_sorted.bam OUTPUT=/home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_CYTO_nodup.bam
java -Xmx10G -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/DRIP/C101HW18101721/raw_data/SIC_CYTO_IN_duplicates.txt INPUT=/home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_CYTO_IN_sorted.bam OUTPUT=/home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_CYTO_IN_nodup.bam TMP_DIR=/home/sb/tmp


#create bw files - DEEPTOOLS
bamCoverage --bam /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_CYTO_sorted_sambamba.bam --binSize 10 -o /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/bigwig/SIC_CYTO.bw
bamCoverage --bam /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIT_CYTO_sorted_sambamba.bam --binSize 10 -o /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/bigwig/SIT_CYTO.bw
bamCoverage --bam /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_NUC_sorted_sambamba.bam --binSize 10 -o /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/bigwig/SIC_NUC.bw
bamCoverage --bam /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIT_NUC_sorted_sambamba.bam --binSize 10 -o /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/bigwig/SIT_NUC.bw

#sort by name

#call peaks - MACS2
macs2 callpeak -t /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_NUC_Nsorted_sambamba.bam -c /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_NUC_IN_Nsorted_sambamba.bam -f BAMPE —g 3.08e9 -n SIC_NUC --broad --q 0.05 --outdir /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/macs2output


bedtools bamtobed -i SIC_NUC_Nsorted_sambamba.bam > SIC_NUC_Nsorted_sambamba.bed
sed 's/^/chr/' SIC_NUC_Nsorted_sambamba.bed > SIC_NUC_diffinput_chr.bed
grep -v "chrMT" SIC_NUC_diffinput_chr.bed > SIC_NUC_diffinput_nochr_nomt.bed

diffReps.pl --treatment /home/sb/DRIP/C101HW18101721/raw_data/aligned/bamtobedfiles/SIT_NUC_diffinput_nochr_nomt.bed --control /home/sb/DRIP/C101HW18101721/raw_data/aligned/bamtobedfiles/SIC_NUC_diffinput_nochr_nomt.bed --report /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/NUC-TvsC --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/DRIP/C101HW18101721/raw_data/aligned/bamtobedfiles/SIT_NUC_IN_diffinput_nochr_nomt.bed --bco /home/sb/DRIP/C101HW18101721/raw_data/aligned/bamtobedfiles/SIC_NUC_IN_diffinput_nochr_nomt.bed --meth gt --nsd broad --noanno --nohs --frag 0 --nproc 17

diffReps.pl --treatment /home/sb/DRIP/C101HW18101721/raw_data/aligned/bamtobedfiles/SIT_CYTO_diffinput_nochr_nomt.bed --control /home/sb/DRIP/C101HW18101721/raw_data/aligned/bamtobedfiles/SIC_CYTO_diffinput_nochr_nomt.bed --report /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/CYTO-TvsC --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/DRIP/C101HW18101721/raw_data/aligned/bamtobedfiles/SIT_CYTO_IN_diffinput_nochr_nomt.bed --bco /home/sb/DRIP/C101HW18101721/raw_data/aligned/bamtobedfiles/SIC_CYTO_IN_diffinput_nochr_nomt.bed --meth gt --nsd broad --noanno --nohs --frag 0 --nproc 17








grep -v '^#' NUC-TvsC | grep -v "Chrom" - | cut -f1,2,3,11,12,14 - | perl -pe "s/\h/\t/g" - > NUC-TvsC_selected.bed
grep -v '^#' CYTO-TvsC | grep -v "Chrom" - | cut -f1,2,3,11,12,14 - | perl -pe "s/\h/\t/g" - > CYTO-TvsC_selected.bed
grep -v -w "inf" CYTO-TvsC_selected.bed > CYTO-TvsC_selected_noinf.bed

awk -F"\t" '{if ($5>1) print $0}' CYTO-TvsC_selected_noinf.bed | perl -pe "s/\h/\t/g" - > CYTO-TvsC_up_lgfc1.bed
awk -F"\t" '{if ($6<0.01) print $0}' CYTO-TvsC_up_lgfc1.bed | perl -pe "s/\h/\t/g" - > CYTO-TvsC_up_lgfc1_padj0.01.bed

awk -F"\t" '{if ($5>1) print $0}' NUC-TvsC_selected.bed | perl -pe "s/\h/\t/g" - > NUC-TvsC_up_lgfc1.bed
awk -F"\t" '{if ($6<0.01) print $0}' NUC-TvsC_up_lgfc1.bed | perl -pe "s/\h/\t/g" - > NUC-TvsC_up_lgfc1_padj0.01.bed

awk -F"\t" '{if ($5<-1) print $0}' CYTO-TvsC_selected_noinf.bed | perl -pe "s/\h/\t/g" - > CYTO-TvsC_down_lgfc1.bed
awk -F"\t" '{if ($6<0.01) print $0}' CYTO-TvsC_down_lgfc1.bed | perl -pe "s/\h/\t/g" - > CYTO-TvsC_down_lgfc1_padj0.01.bed

awk -F"\t" '{if ($5<-1) print $0}' NUC-TvsC_selected.bed | perl -pe "s/\h/\t/g" - > NUC-TvsC_down_lgfc1.bed
awk -F"\t" '{if ($6<0.01) print $0}' NUC-TvsC_down_lgfc1.bed | perl -pe "s/\h/\t/g" - > NUC-TvsC_down_lgfc1_padj0.01.bed



#homer annotate peaks
source ~/.bashrc_profile
annotatePeaks.pl NUC_up.bed hg38 > NUC_up_homerannot.txt -annStats NUC_up_stats.txt
#extract gene IDs of intronic differential RNA-DNA hybrids
grep "intron" CYTO_down_homerannot_gtf.txt | cut -f9 | sed 's/.*(\(.*\))/\1/' | cut -d',' -f1 > CYTO_down_intron_geneid.txt




#Rep2
/home/sb/programfiles/bwa/bwa mem -M -t 25 /home/sb/genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP_R2/A1311/raw_data/SIC_CYTO_1.fq.gz /home/sb/DRIP_R2/A1311/raw_data/SIC_CYTO_2.fq.gz > /home/sb/DRIP_R2/A1311/raw_data/align/SIC_CYTO.sam
/home/sb/programfiles/bwa/bwa mem -M -t 25 /home/sb/genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP_R2/A1311/raw_data/SIT_CYTO_1.fq.gz /home/sb/DRIP_R2/A1311/raw_data/SIT_CYTO_2.fq.gz > /home/sb/DRIP_R2/A1311/raw_data/align/SIT_CYTO.sam

/home/sb/programfiles/bwa/bwa mem -M -t 25 /home/sb/genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP_R2/A1311/raw_data/SIC_NUC_1.fq.gz /home/sb/DRIP_R2/A1311/raw_data/SIC_NUC_2.fq.gz > /home/sb/DRIP_R2/A1311/raw_data/align/SIC_NUC.sam
/home/sb/programfiles/bwa/bwa mem -M -t 25 /home/sb/genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP_R2/A1311/raw_data/SIT_NUC_1.fq.gz /home/sb/DRIP_R2/A1311/raw_data/SIT_NUC_2.fq.gz > /home/sb/DRIP_R2/A1311/raw_data/align/SIT_NUC.sam


/home/sb/programfiles/bwa/bwa mem -M -t 25 /home/sb/genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP_R2/A1311/raw_data/SIC_CYTO_IN_1.fq.gz /home/sb/DRIP_R2/A1311/raw_data/SIC_CYTO_IN_2.fq.gz > /home/sb/DRIP_R2/A1311/raw_data/align/SIC_CYTO_IN.sam
/home/sb/programfiles/bwa/bwa mem -M -t 25 /home/sb/genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP_R2/A1311/raw_data/SIT_CYTO_IN_1.fq.gz /home/sb/DRIP_R2/A1311/raw_data/SIT_CYTO_IN_2.fq.gz > /home/sb/DRIP_R2/A1311/raw_data/align/SIT_CYTO_IN.sam

/home/sb/programfiles/bwa/bwa mem -M -t 25 /home/sb/genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP_R2/A1311/raw_data/SIC_NUC_IN_1.fq.gz /home/sb/DRIP_R2/A1311/raw_data/SIC_NUC_IN_2.fq.gz > /home/sb/DRIP_R2/A1311/raw_data/align/SIC_NUC_IN.sam
/home/sb/programfiles/bwa/bwa mem -M -t 25 /home/sb/genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP_R2/A1311/raw_data/SIT_NUC_IN_1.fq.gz /home/sb/DRIP_R2/A1311/raw_data/SIT_NUC_IN_2.fq.gz > /home/sb/DRIP_R2/A1311/raw_data/align/SIT_NUC_IN.sam

sambamba markdup -r SIC_CYTO_sorted.bam SIC_CYTO_sorted_sambamba.bam -t 10

sambamba markdup -r SIT_CYTO_sorted.bam SIT_CYTO_sorted_sambamba.bam -t 10

sambamba markdup -r SIC_NUC_sorted.bam SIC_NUC_sorted_sambamba.bam -t 10

sambamba markdup -r SIT_NUC_sorted.bam SIT_NUC_sorted_sambamba.bam -t 10


sambamba markdup -r SIC_CYTO_IN_sorted.bam SIC_CYTO_IN_sorted_sambamba.bam -t 20

sambamba markdup -r SIT_CYTO_IN_sorted.bam SIT_CYTO_IN_sorted_sambamba.bam -t 20

sambamba markdup -r SIC_NUC_IN_sorted.bam SIC_NUC_IN_sorted_sambamba.bam -t 20

sambamba markdup -r SIT_NUC_IN_sorted.bam SIT_NUC_IN_sorted_sambamba.bam -t 20


bedtools bamtobed -i SIT_CYTO_sorted_sambamba.bam | sed 's/^/chr/' - | grep -v "chrMT" > SIT_CYTO_sorted_sambamba.bed

diffReps.pl --treatment /home/sb/DRIP_R2/A1311/raw_data/align/SIT_NUC_sorted_sambamba.bed --control /home/sb/DRIP_R2/A1311/raw_data/align/SIC_NUC_sorted_sambamba.bed --report /home/sb/DRIP_R2/A1311/raw_data/align/R2NUC-TvsC --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/DRIP_R2/A1311/raw_data/align/SIT_NUC_IN_sorted_sambamba.bed --bco /home/sb/DRIP_R2/A1311/raw_data/align/SIC_NUC_IN_sorted_sambamba.bed --meth gt --nsd broad --noanno --nohs --frag 0 --nproc 17
diffReps.pl --treatment /home/sb/DRIP/C101HW18101721/raw_data/aligned/bamtobedfiles/SIT_NUC_diffinput_nochr_nomt.bed /home/sb/DRIP_R2/A1311/raw_data/align/SIT_NUC_sorted_sambamba.bed --control /home/sb/DRIP/C101HW18101721/raw_data/aligned/bamtobedfiles/SIC_NUC_diffinput_nochr_nomt.bed /home/sb/DRIP_R2/A1311/raw_data/align/SIC_NUC_sorted_sambamba.bed --report /home/sb/DRIP_R2/A1311/raw_data/align/R1R2NUC-TvsC --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/DRIP/C101HW18101721/raw_data/aligned/bamtobedfiles/SIT_NUC_IN_diffinput_nochr_nomt.bed /home/sb/DRIP_R2/A1311/raw_data/align/SIT_NUC_IN_sorted_sambamba.bed --bco /home/sb/DRIP/C101HW18101721/raw_data/aligned/bamtobedfiles/SIC_NUC_IN_diffinput_nochr_nomt.bed /home/sb/DRIP_R2/A1311/raw_data/align/SIC_NUC_IN_sorted_sambamba.bed --meth gt --nsd broad --noanno --nohs --frag 0 --nproc 17

diffReps.pl --treatment /home/sb/DRIP_R2/A1311/raw_data/align/SIT_CYTO_sorted_sambamba.bed --control /home/sb/DRIP_R2/A1311/raw_data/align/SIC_CYTO_sorted_sambamba.bed --report /home/sb/DRIP_R2/A1311/raw_data/align/R2CYTO-TvsC --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/DRIP_R2/A1311/raw_data/align/SIT_CYTO_IN_sorted_sambamba.bed --bco /home/sb/DRIP_R2/A1311/raw_data/align/SIC_CYTO_IN_sorted_sambamba.bed --meth gt --nsd broad --noanno --nohs --frag 0 --nproc 17
diffReps.pl --treatment /home/sb/DRIP/C101HW18101721/raw_data/aligned/bamtobedfiles/SIT_CYTO_diffinput_nochr_nomt.bed /home/sb/DRIP_R2/A1311/raw_data/align/SIT_CYTO_sorted_sambamba.bed --control /home/sb/DRIP/C101HW18101721/raw_data/aligned/bamtobedfiles/SIC_CYTO_diffinput_nochr_nomt.bed /home/sb/DRIP_R2/A1311/raw_data/align/SIC_CYTO_sorted_sambamba.bed --report /home/sb/DRIP_R2/A1311/raw_data/align/R1R2CYTO-TvsC --chrlen /home/sb/genome_data/GRCh38/hg38.chrom.sizes --btr /home/sb/DRIP/C101HW18101721/raw_data/aligned/bamtobedfiles/SIT_CYTO_IN_diffinput_nochr_nomt.bed /home/sb/DRIP_R2/A1311/raw_data/align/SIT_CYTO_IN_sorted_sambamba.bed --bco /home/sb/DRIP/C101HW18101721/raw_data/aligned/bamtobedfiles/SIC_CYTO_IN_diffinput_nochr_nomt.bed /home/sb/DRIP_R2/A1311/raw_data/align/SIC_CYTO_IN_sorted_sambamba.bed --meth gt --nsd broad --noanno --nohs --frag 0 --nproc 17


