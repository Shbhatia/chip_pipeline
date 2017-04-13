#create tag directories for ChIP data
/home/sb/programfiles/homer/bin/makeTagDirectory MCF7-H3K27ac-0h-ChIP-Seq/ /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/sorted2.bam -format sam
/home/sb/programfiles/homer/bin/makeTagDirectory MCF7-H3K27ac-4h-ChIP-Seq/ /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output/sorted2.bam -format sam
/home/sb/programfiles/homer/bin/makeTagDirectory MCF7-H3K27ac-24h-ChIP-Seq/ /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/sorted2.bam -format sam


/home/sb/programfiles/homer/bin/makeTagDirectory MCF7-Input-0h-ChIP-Seq/ /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-1/star_output/sorted2.bam -format sam
/home/sb/programfiles/homer/bin/makeTagDirectory MCF7-Input-4h-ChIP-Seq/ /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-2/star_output/sorted2.bam -format sam
/home/sb/programfiles/homer/bin/makeTagDirectory MCF7-Input-24h-ChIP-Seq/ /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Input-3/star_output/sorted2.bam -format sam

/home/sb/programfiles/homer/bin/findPeaks MCF7-H3K27ac-0h-ChIP-Seq/ -style histone -o auto -i MCF7-Input-0h-ChIP-Seq
/home/sb/programfiles/homer/bin/findPeaks MCF7-H3K27ac-4h-ChIP-Seq/ -style histone -o auto -i MCF7-Input-4h-ChIP-Seq
/home/sb/programfiles/homer/bin/findPeaks MCF7-H3K27ac-24h-ChIP-Seq/ -style histone -o auto -i MCF7-Input-24h-ChIP-Seq

/home/sb/programfiles/homer/bin/findPeaks MCF7-H3K27ac-0h-ChIP-Seq/ -i MCF7-Input-0h-ChIP-Seq -style super -o 0h_se -L 0 -typical 0h_typical.txt
/home/sb/programfiles/homer/bin/findPeaks MCF7-H3K27ac-4h-ChIP-Seq/ -i MCF7-Input-4h-ChIP-Seq -style super -o 4h_se -L 0 -typical 4h_typical.txt
/home/sb/programfiles/homer/bin/findPeaks MCF7-H3K27ac-24h-ChIP-Seq/ -i MCF7-Input-24h-ChIP-Seq -style super -o 24h_se -L 0 -typical 24h_typical.txt

/home/sb/programfiles/homer/bin/findPeaks MCF7-H3K27ac-0h-ChIP-Seq/ -i MCF7-Input-0h-ChIP-Seq -style super -o 0h_allpeaks -L 0 -superSlope -1000
/home/sb/programfiles/homer/bin/findPeaks MCF7-H3K27ac-4h-ChIP-Seq/ -i MCF7-Input-4h-ChIP-Seq -style super -o 4h_allpeaks -L 0 -superSlope -1000
/home/sb/programfiles/homer/bin/findPeaks MCF7-H3K27ac-24h-ChIP-Seq/ -i MCF7-Input-24h-ChIP-Seq -style super -o 24h_allpeaks -L 0 -superSlope -1000

#grep columns with chrom number, start and end
grep -v '^#' 0h_se | cut -f2,3,4 - | sed 's/^/chr/' - > 0h_se_nohead.txt
grep -v '^#' 4h_se | cut -f2,3,4 - | sed 's/^/chr/' - > 4h_se_nohead.txt
grep -v '^#' 24h_se | cut -f2,3,4 - | sed 's/^/chr/' - > 24h_se_nohead.txt

#intersect predicted super enhancer genomic intervals
bedtools intersect -a 0h_se_nohead.txt -b 4h_se_nohead.txt -u > 0_4_se.bed
bedtools intersect -a 0h_se_nohead.txt -b 24h_se_nohead.txt -u > 0_24_se.bed
bedtools intersect -a 0_4_se.bed -b 24h_se_nohead.txt -v > 0_4_no24.bed
bedtools intersect -a 0_24_se.bed -b 4h_se_nohead.txt -v > 0_24_no4.bed
bedtools intersect -a 4h_se_nohead.txt -b 24h_se_nohead.txt -u > 4_24_se.bed
bedtools intersect -a 4_24_se.bed -b 0h_se_nohead.txt -v > 4_24_no0.bed
bedtools intersect -a 4_24_se.bed -b 0h_se_nohead.txt -u > 4_24_0.bed

#create venn diagram (see 3circle_venn.py script)
#create bar plot (see se_barplot.py script)

