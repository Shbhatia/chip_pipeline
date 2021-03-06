#creating regions BED file for the whole genome (hg38) with a 1Mb window
bedtools makewindows -g /home/sb/genome_data/GRCh38/hg38.chrom.sizes -w 100000 > regions.bed
#remove alternative chromosomes and chromosome M from regions bed file
sed '/_/d' ./regions2.bed > regions_new.bed
sed '/M/d' ./regions_new.bed > regions.bed
#Create a counts matrix
/home/sb/programfiles/epicseg.R getcounts --regions /home/sb/grace/epicseg/regions.bed --mark ctcf:/home/sb/grace/chromhmm/inputdir/mcf7_ctcf.bam --mark p300:/home/sb/grace/chromhmm/inputdir/mcf7_p300.bam --mark h3k27ac:/home/sb/grace/chromhmm/inputdir/mcf7_h3k27ac.bam --mark h3k4me1:/home/sb/grace/chromhmm/inputdir/mcf7_h3k4me1.bam --mark h3k4me2:/home/sb/grace/chromhmm/inputdir/mcf7_h3k4me2.bam --mark h3k36me3:/home/sb/grace/chromhmm/inputdir/mcf7_h3k36me3.bam --mark h3k27me3:/home/sb/grace/chromhmm/inputdir/mcf7_h3k27me3.bam --mark h3k9ac:/home/sb/grace/chromhmm/inputdir/mcf7_h3k9ac.bam --mark dnase:/home/sb/grace/chromhmm/inputdir/mcf7_dnase.bam --target /home/sb/grace/epicseg/epic_out1.txt --nthreads 15
Rscript epicseg.R getcounts --regions /home/sb/epicseg/grace_peaks/regions.bed --mark h3k4me3:/home/sb/inputdir/mcf7_h3k4me3.bam --mark h3k27ac:/home/sb/inputdir/mcf7_h3k27ac.bam --mark h3k4me1:/home/sb/inputdir/mcf7_h3k4me1.bam --mark h3k36me3:/home/sb/inputdir/mcf7_h3k36me3.bam --mark h3k27me3:/home/sb/inputdir/mcf7_h3k27me3.bam --mark h3k9ac:/home/sb/inputdir/mcf7_h3k9ac.bam --target /home/sb/epicseg/epic_out4.txt --nthreads 15
Rscript epicseg.R getcounts --regions /home/sb/grace/epicseg/macs_q0.01/q0.01_regions.bed --mark h3k4me3:/home/sb/grace/chromhmm/inputdir/mcf7_h3k4me3.bam --mark h3k27ac:/home/sb/grace/chromhmm/inputdir/mcf7_h3k27ac.bam --mark h3k4me1:/home/sb/grace/chromhmm/inputdir/mcf7_h3k4me1.bam --mark h3k36me3:/home/sb/grace/chromhmm/inputdir/mcf7_h3k36me3.bam --mark h3k27me3:/home/sb/grace/chromhmm/inputdir/mcf7_h3k27me3.bam --mark h3k9ac:/home/sb/grace/chromhmm/inputdir/mcf7_h3k9ac.bam --target /home/sb/grace/epicseg/macs_q0.01/epic_out5.txt --nthreads 15
Rscript /home/sb/programfiles/epicseg.R getcounts --regions /home/sb/grace/homer/homer_merge.bed --mark h3k4me3:/home/sb/grace/chromhmm/inputdir/mcf7_h3k4me3.bam --mark h3k27ac:/home/sb/grace/chromhmm/inputdir/mcf7_h3k27ac.bam --mark h3k4me1:/home/sb/grace/chromhmm/inputdir/mcf7_h3k4me1.bam --mark h3k36me3:/home/sb/grace/chromhmm/inputdir/mcf7_h3k36me3.bam --mark h3k27me3:/home/sb/grace/chromhmm/inputdir/mcf7_h3k27me3.bam --mark h3k9ac:/home/sb/grace/chromhmm/inputdir/mcf7_h3k9ac.bam --target /home/sb/grace/epicseg/homer/homer_epic_output.txt --nthreads 15

#Run segmentation - on server
/home/sb/programfiles/epicseg.R segment --counts /home/sb/grace/epicseg/epic_out1.txt --regions /home/sb/grace/epicseg/epic_out1_refined_regions.bed --nstates 8 --nthreads 15 --outdir /home/sb/grace/epicseg
#Run segmentation - locally
Rscript epicseg.R segment --counts ./epic_out1.txt --regions ./epic_out1_refined_regions.bed --nstates 8 --nthreads 15 --outdir ./ 
#4-state model without H3k4me3
Rscript ../epicseg.R segment --counts ./epic_out3.txt --regions ./epic_out3_refined_regions.bed --nstates 4 --nthreads 4 --outdir ./4state_1 
#4-state model with H3k4me3
Rscript ../epicseg.R segment --counts ./epic_out4.txt --regions ./epic_out4_refined_regions.bed --nstates 4 --nthreads 4 --outdir ./4state_2 
#4-state model (macs done with q = 0.01)
Rscript ../../epicseg.R segment --counts ./epic_out5.txt --regions ./epic_out5_refined_regions.bed --nstates 4 --nthreads 4 --outdir ./4state_q0.01 

#4-state model (peaks called with homer for regions BED file)
Rscript ../../epicseg.R segment --counts ./homer_epic_output.txt --regions ./homer_epic_output_refined_regions.bed --nstates 4 --nthreads 4 --outdir ./


