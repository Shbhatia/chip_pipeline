#creating regions BED file for the whole genome (hg38) with a 1Mb window
bedtools makewindows -g /home/sb/genome_data/GRCh38/hg38.chrom.sizes -w 100000 > regions.bed
#remove alternative chromosomes and chromosome M from regions bed file
sed '/_/d' ./regions2.bed > regions_new.bed
sed '/M/d' ./regions_new.bed > regions.bed
#Create a counts matrix
/home/sb/programfiles/epicseg.R getcounts --regions /home/sb/grace/epicseg/regions.bed --mark ctcf:/home/sb/grace/chromhmm/inputdir/mcf7_ctcf.bam --mark p300:/home/sb/grace/chromhmm/inputdir/mcf7_p300.bam --mark h3k27ac:/home/sb/grace/chromhmm/inputdir/mcf7_h3k27ac.bam --mark h3k4me1:/home/sb/grace/chromhmm/inputdir/mcf7_h3k4me1.bam --mark h3k4me2:/home/sb/grace/chromhmm/inputdir/mcf7_h3k4me2.bam --mark h3k36me3:/home/sb/grace/chromhmm/inputdir/mcf7_h3k36me3.bam --mark h3k27me3:/home/sb/grace/chromhmm/inputdir/mcf7_h3k27me3.bam --mark h3k9ac:/home/sb/grace/chromhmm/inputdir/mcf7_h3k9ac.bam --mark dnase:/home/sb/grace/chromhmm/inputdir/mcf7_dnase.bam --target /home/sb/grace/epicseg/epic_out1.txt --nthreads 15

#Run segmentation
/home/sb/programfiles/epicseg.R segment --counts /home/sb/grace/epicseg/epic_out1.txt --regions /home/sb/grace/epicseg/epic_out1_refined_regions.bed --nstates 8 --nthreads 15 --outdir /home/sb/grace/epicseg
