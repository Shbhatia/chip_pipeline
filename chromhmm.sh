#Binarize Bam files
java -jar ChromHMM.jar BinarizeBam /home/sb/genome_data/GRCh38/hg38.chrom.sizes /home/sb/grace/chromhmm/inputdir /home/sb/grace/chromhmm/cellmarkfiletable.txt /home/sb/grace/chromhmm/outputbinarydir
#Binarize Bed (gr@ce_data only)
java -jar ChromHMM.jar BinarizeBed /home/sb/genome_data/GRCh38/hg38.chrom.sizes /home/sb/grace/chromhmm/bed_input /home/sb/grace/chromhmm/bed_input/cellmarkfiletable2.txt /home/sb/grace/chromhmm/bed_input/outputbinarydir
