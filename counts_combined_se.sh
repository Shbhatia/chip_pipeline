beads bed2gff combined_se.bed > combined_se.gff

htseq-count -f bam -r pos --stranded=no /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/sorted2.bam /home/sb/modified_se_galaxy.gff
htseq-count -f bam -r pos --stranded=no /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output/sorted2.bam /home/sb/modified_se_galaxy.gff
htseq-count -f bam -r pos --stranded=no /home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/sorted2.bam /home/sb/modified_se_galaxy.gff
echo -e "seid\tchr\tstart\tend\tstrand" | cat - new_combined_se.tsv > /tmp/out && mv /tmp/out new_combined_se.tsv

library(Rsubread)

anno <- read.table(file = 'head_combined.tsv', sep = '\t', header = TRUE)
colnames(anno)=c("GeneID","Chr","Start","End","Strand")
data<-featureCounts(c("/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-1/star_output/sorted2.bam", "/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-2/star_output/sorted2.bam", "/home/sb/grace/chip/cdts-wh.genomics.cn/F16FTSAPHT1209_HUMbgsC/Clean/Ac-3/star_output/sorted2.bam"),
annot.ext= anno,
autosort=TRUE,
minMQS=0,
strandSpecific=0,
isPairedEnd=TRUE,
nthreads=15,
allowMultiOverlap=TRUE,
minFragLength=0,
maxFragLength=1000000)

counts=data[[1]]
pdf("moco3.pdf")
plot(log2(counts[,1]/49559219),log2(counts[,3]/53953899), text(anno("GeneID"))
plot(log2(counts[,1]/49559219),log2(counts[,2]/52676760))
 dev.off()
 
 abs(log2(counts[,1]/49559219)-log2(counts[,2]/52676760))[order(abs(log2(counts[,1]/49559219)-log2(counts[,2]/52676760)))]

topse1 <- tail(counts[order(abs(log2(counts[,1]/49559219)-log2(counts[,2]/52676760))),])
topse2 <- tail(counts[order(abs(log2(counts[,1]/49559219)-log2(counts[,3]/53953899))),])
write.table(topse1, "./top2vs1.txt", sep="\t")
write.table(topse2, "./top3vs1.txt", sep="\t")
