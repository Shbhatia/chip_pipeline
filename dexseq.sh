#prepare annotation
python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_prepare_annotation.py /home/sb/genome_data/GRCh38/annotation/

#samtools sort by name
samtools sort -n Aligned.out.bam > sorted_n.bam --threads 20

#created bin intervals
python /home/sb/R/x86_64-pc-linux-gnu-library/3.3/DEXSeq/python_scripts/dexseq_count.py /home/sb/Homo_sapiens_DEXSeq.chr.gff /home/sb/star_output/10a_sic_star_ucsc/sorted_n.bam /home/sb/dexseq_untreated1.txt -p yes -f bam


