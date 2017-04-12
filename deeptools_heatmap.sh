#computematrix
computeMatrix reference-point -S /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/h3k27ac0h_seqdepthnorm.bw -R /home/sb/grace/epicseg/4state_q0.01/state3.bed --outFileName /home/sb/grace/epicseg/4state_q0.01/heatmap1 --referencePoint center -b 500 -a 500 --blackListFileName /home/sb/genome_data/GRCh38/hg38.blacklist.bed --numberOfProcessors 10
#computematrix with homerout+epicseg (4-state; state 3)
computeMatrix reference-point -S /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/h3k27ac0h_seqdepthnorm.bw -R /home/sb/grace/epicseg/homer/state3.bed --outFileName /home/sb/grace/epicseg/homer/heatmap_homer.gz --referencePoint center -b 5000 -a 5000 --blackListFileName /home/sb/genome_data/GRCh38/hg38.blacklist.bed --numberOfProcessors 20
computeMatrix reference-point -S /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output/h3k27ac4h_seqdepthnorm.bw -R /home/sb/grace/epicseg/homer/state3.bed --outFileName /home/sb/grace/epicseg/homer/heatmap_homer_4h.gz --referencePoint center -b 5000 -a 5000 --blackListFileName /home/sb/genome_data/GRCh38/hg38.blacklist.bed --numberOfProcessors 20
computeMatrix reference-point -S /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/h3k27ac24h_seqdepthnorm.bw -R /home/sb/grace/epicseg/homer/state3.bed --outFileName /home/sb/grace/epicseg/homer/heatmap_homer_24h.gz --referencePoint center -b 5000 -a 5000 --blackListFileName /home/sb/genome_data/GRCh38/hg38.blacklist.bed --numberOfProcessors 20

#heatmap
plotHeatmap --matrixFile /home/sb/grace/epicseg/4state_q0.01/matrix1 --outFileName heatmap_h3k27ac_enh.pdf 
plotHeatmap --matrixFile /home/sb/grace/epicseg/homer/heatmap_homer_0h.gz --outFileName /home/sb/grace/epicseg/homer/heatmap_h3k27ac_enh_0h.pdf 
plotHeatmap --matrixFile /home/sb/grace/epicseg/homer/heatmap_homer_4h.gz --outFileName /home/sb/grace/epicseg/homer/heatmap_h3k27ac_enh_4h.pdf 
plotHeatmap --matrixFile /home/sb/grace/epicseg/homer/heatmap_homer_24h.gz --outFileName /home/sb/grace/epicseg/homer/heatmap_h3k27ac_enh_24h.pdf 


#compute matrix form diffreps output
computeMatrix reference-point -S /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/h3k27ac0h_seqdepthnorm.bw -R /home/sb/grace/chip/diffreps_output/heatmaps/3vs1_up.bed --outFileName /home/sb/grace/chip/diffreps_output/heatmaps/matrix_ac3vs1_up.gz --referencePoint center -b 5000 -a 5000 --numberOfProcessors 10
plotHeatmap --matrixFile /home/sb/grace/chip/diffreps_output/heatmaps/matrix_ac3vs1_up.gz --outFileName /home/sb/grace/epicseg/homer/heatmap_ac3vs1_up.pdf --refPointLabel Differential peaks --xAxisLabel Distance from peak center (bp) --plotTitle H3K27ac in MCf-7 in Normoxia --yAxisLabel Differential peaks --regionsLabel HELLO 
computeMatrix reference-point -S /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/h3k27ac24h_seqdepthnorm.bw -R /home/sb/grace/chip/diffreps_output/heatmaps/3vs1_up.bed --outFileName /home/sb/grace/chip/diffreps_output/heatmaps/matrix_ac3vs1_24h_up.gz --referencePoint center -b 5000 -a 5000 --numberOfProcessors 10
plotHeatmap --matrixFile /home/sb/grace/chip/diffreps_output/heatmaps/matrix_ac3vs1_24_up.gz --outFileName /home/sb/grace/epicseg/homer/heatmap_ac3vs1_24_up.pdf --refPointLabel Midpoint


computeMatrix reference-point -S /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/h3k27ac0h_seqdepthnorm.bw -R /home/sb/grace/chip/diffreps_output/heatmaps/3vs1_down.bed --outFileName /home/sb/grace/chip/diffreps_output/heatmaps/matrix_ac3vs1_down.gz --referencePoint center -b 5000 -a 5000 --numberOfProcessors 10
plotHeatmap --matrixFile /home/sb/grace/chip/diffreps_output/heatmaps/matrix_ac3vs1_down.gz --outFileName /home/sb/grace/chip/diffreps_output/heatmaps/heatmap_ac3vs1_down.pdf --refPointLabel Midpoint
computeMatrix reference-point -S /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/h3k27ac24h_seqdepthnorm.bw -R /home/sb/grace/chip/diffreps_output/heatmaps/3vs1_up.bed --outFileName /home/sb/grace/chip/diffreps_output/heatmaps/matrix_ac3vs1_24h_down.gz --referencePoint center -b 5000 -a 5000 --numberOfProcessors 10
plotHeatmap --matrixFile /home/sb/grace/chip/diffreps_output/heatmaps/matrix_ac3vs1_24h_down.gz --outFileName /home/sb/grace/chip/diffreps_output/heatmaps/heatmap_ac3vs1_24_down.pdf --refPointLabel Midpoint


computeMatrix reference-point -S /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/h3k27ac0h_seqdepthnorm.bw /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/h3k27ac24h_seqdepthnorm.bw -R /home/sb/grace/chip/diffreps_output/heatmaps/3vs1_up.bed --outFileName /home/sb/grace/chip/diffreps_output/heatmaps/matrix_ac3vs1_comp_up.gz --referencePoint center -b 5000 -a 5000 --numberOfProcessors 10
computeMatrix reference-point -S /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/h3k27ac0h_seqdepthnorm.bw /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/h3k27ac24h_seqdepthnorm.bw -R /home/sb/grace/chip/diffreps_output/heatmaps/3vs1_down.bed --outFileName /home/sb/grace/chip/diffreps_output/heatmaps/matrix_ac3vs1_comp_down.gz --referencePoint center -b 5000 -a 5000 --numberOfProcessors 10
plotHeatmap --matrixFile /home/sb/grace/chip/diffreps_output/heatmaps/matrix_ac3vs1_comp_up.gz --outFileName /home/sb/grace/chip/diffreps_output/heatmaps/heatmap_ac3vs1_comp_up.pdf --refPointLabel "Peak center" --xAxisLabel "Distance from peak center (bp)" --plotTitle "Increased H3K27ac enrichment in MCF-7 in Normoxia and Hypoxia" --regionsLabel "H3K27ac Enrichment"
plotHeatmap --matrixFile /home/sb/grace/chip/diffreps_output/heatmaps/matrix_ac3vs1_comp_down.gz --outFileName /home/sb/grace/chip/diffreps_output/heatmaps/heatmap_ac3vs1_comp_down.pdf --refPointLabel "Peak center" --xAxisLabel "Distance from peak center (bp)" --plotTitle "Decreased H3K27ac enrichment in MCF-7 in Normoxia and Hypoxia" --regionsLabel "H3K27ac Enrichment"


computeMatrix scale-regions -S /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/h3k27ac0h_seqdepthnorm.bw /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/h3k27ac24h_seqdepthnorm.bw -R /home/sb/grace/chip/diffreps_output/heatmaps/3vs1_down.bed --outFileName /home/sb/grace/chip/diffreps_output/heatmaps/scalematrix_ac3vs1_comp_up.gz -b 3000 -a 3000 --numberOfProcessors 10
plotHeatmap --matrixFile /home/sb/grace/chip/diffreps_output/heatmaps/scalematrix_ac3vs1_comp_up.gz --outFileName /home/sb/grace/chip/diffreps_output/heatmaps/scaleheatmap_ac3vs1_comp_up.pdf
