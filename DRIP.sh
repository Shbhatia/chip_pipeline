programfiles/bwa/bwa index genome_data/GRCh38/sequence/GRCh38_r77.all.fa

programfiles/bwa/bwa mem -M -t 25 genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP/C101HW18101721/raw_data/SIC_CYTO_1.fq.gz /home/sb/DRIP/C101HW18101721/raw_data/SIC_CYTO_2.fq.gz > /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_CYTO.sam

programfiles/bwa/bwa mem -M -t 25 genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP/C101HW18101721/raw_data/SIC_CYTO_IN_1.fq.gz /home/sb/DRIP/C101HW18101721/raw_data/SIC_CYTO_IN_2.fq.gz > /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_CYTO_IN.sam

programfiles/bwa/bwa mem -M -t 25 genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP/C101HW18101721/raw_data/SIT_CYTO_1.fq.gz /home/sb/DRIP/C101HW18101721/raw_data/SIT_CYTO_2.fq.gz > /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIT_CYTO_1.sam

programfiles/bwa/bwa mem -M -t 25 genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP/C101HW18101721/raw_data/SIT_CYTO_IN_1.fq.gz /home/sb/DRIP/C101HW18101721/raw_data/SIT_CYTO_IN_2.fq.gz > /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIT_CYTO_IN_1.sam

programfiles/bwa/bwa mem -M -t 25 genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP/C101HW18101721/raw_data/SIC_NUC_1.fq.gz /home/sb/DRIP/C101HW18101721/raw_data/SIC_NUC_2.fq.gz > /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_NUC.sam

programfiles/bwa/bwa mem -M -t 25 genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP/C101HW18101721/raw_data/SIT_NUC_1.fq.gz /home/sb/DRIP/C101HW18101721/raw_data/SIT_NUC_2.fq.gz > /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIT_NUC.sam

programfiles/bwa/bwa mem -M -t 25 genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP/C101HW18101721/raw_data/SIC_NUC_IN_1.fq.gz /home/sb/DRIP/C101HW18101721/raw_data/SIC_NUC_IN_2.fq.gz > /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_NUC_IN.sam

programfiles/bwa/bwa mem -M -t 25 genome_data/GRCh38/sequence/GRCh38_r77.all.fa /home/sb/DRIP/C101HW18101721/raw_data/SIT_NUC_IN_1.fq.gz /home/sb/DRIP/C101HW18101721/raw_data/SIT_NUC_IN_2.fq.gz > /home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIT_NUC_IN.sam

#MarkDuplicates
java -jar /home/sb/programfiles/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true METRICS_FILE=/home/sb/DRIP/C101HW18101721/raw_data/SIC_CYTO_duplicates.txt INPUT=/home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_CYTO_sorted.bam OUTPUT=/home/sb/DRIP/C101HW18101721/raw_data/bwaalign/SIC_CYTO_nodup.bam
