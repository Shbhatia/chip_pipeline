#computematrix
computeMatrix reference-point -S /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/h3k27ac0h_seqdepthnorm.bw -R /home/sb/grace/epicseg/4state_q0.01/state3.bed --outFileName /home/sb/grace/epicseg/4state_q0.01/heatmap1 --referencePoint center -b 500 -a 500 --blackListFileName /home/sb/genome_data/GRCh38/hg38.blacklist.bed --numberOfProcessors 10
#computematrix with homerout+epicseg (4-state; state 3)
computeMatrix reference-point -S /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/h3k27ac0h_seqdepthnorm.bw -R /home/sb/grace/epicseg/homer/state3.bed --outFileName /home/sb/grace/epicseg/homer/heatmap_homer.gz --referencePoint center -b 5000 -a 5000 --blackListFileName /home/sb/genome_data/GRCh38/hg38.blacklist.bed --numberOfProcessors 20
#heatmap
plotHeatMap --matrixfile /home/sb/grace/epicseg/4state_q0.01/matrix1 --outFileName heatmap_h3k27ac_enh.pdf 
plotHeatMap --matrixfile /home/sb/grace/epicseg/homer/heatmap_homer.gz --outFileName /home/sb/grace/epicseg/homer/heatmap_h3k27ac_enh.pdf 
