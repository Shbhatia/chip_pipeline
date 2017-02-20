#Binarize Bam files
java -jar ChromHMM.jar BinarizeBam /home/sb/genome_data/GRCh38/hg38.chrom.sizes /home/sb/grace/chromhmm/inputdir /home/sb/grace/chromhmm/inputdir/cellmarkfiletable.txt /home/sb/grace/chromhmm/outputbinarydir


#Create bed file from alignment output (no duplicates, sorted and indexed bam file)
bedtools bamtobed -i sorted2.bam > mcf7_h3k27ac.bed
bedtools bamtobed -i sorted2.bam > mcf7_h3k4me1.bed

#Binarize Bed (gr@ce_data only)
java -jar ChromHMM.jar BinarizeBed /home/sb/genome_data/GRCh38/hg38.chrom.sizes /home/sb/grace/chromhmm/bed_input /home/sb/grace/chromhmm/bed_input/cellmarkfiletable2.txt /home/sb/grace/chromhmm/bed_input/outputbinarydir


#Learnmodel
