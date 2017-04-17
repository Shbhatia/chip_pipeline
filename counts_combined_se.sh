beads bed2gff combined_se.bed > combined_se.gff

htseq-count -f bam -r pos --stranded=no /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/sorted2.bam /home/sb/modified_se_galaxy.gff
htseq-count -f bam -r pos --stranded=no /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output/sorted2.bam /home/sb/modified_se_galaxy.gff
htseq-count -f bam -r pos --stranded=no /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/sorted2.bam /home/sb/modified_se_galaxy.gff

